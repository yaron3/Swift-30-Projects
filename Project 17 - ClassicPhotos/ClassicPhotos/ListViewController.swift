//
//  ListViewController.swift
//  ClassicPhotos
//
//  Copyright (c) 2014 raywenderlich. All rights reserved.
//

import UIKit
import CoreImage

let dataSourceURL = URL(string:"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist")

class ListViewController: UITableViewController {
  
  var photos = [PhotoRecord]()
  let pendingOperations = PendingOperations()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Classic Photos"
    
    fetchPhotoDetails()
  }
  
    fileprivate func fetchPhotoDetails() {
        guard let url = dataSourceURL else { return }
        let request = URLRequest(url: url)

        // (Deprecated since iOS 13; removed in iOS 15 — safe to just remove this)
        // UIApplication.shared.isNetworkActivityIndicatorVisible = true

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let self = self else { return }

                if let error = error {
                    let alert = UIAlertController(title: "Oops!", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))

                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootVC = scene.windows.first?.rootViewController {
                        rootVC.present(alert, animated: true)
                    }
                    return
                }

                guard let data = data else { return }

                do {
                    if let datasourceDictionary = try PropertyListSerialization.propertyList(
                        from: data,
                        options: [],
                        format: nil
                    ) as? [String: AnyObject] {
                        
                        for (name, value) in datasourceDictionary {
                            if let urlString = value as? String,
                               let url = URL(string: urlString) {
                                let photoRecord = PhotoRecord(name: name, url: url)
                                self.photos.append(photoRecord)
                            }
                        }

                        self.tableView.reloadData()
                    }
                } catch {
                    print("Property list parsing error: \(error.localizedDescription)")
                }

                // No need to reset network activity indicator
            }
        }.resume()
    }
  
  fileprivate func startOperationsForPhotoRecord(photoDetails: PhotoRecord, indexPath: IndexPath){
    switch (photoDetails.state) {
    case .New:
      startDownloadForRecord(photoDetails: photoDetails, indexPath: indexPath)
    case .Downloaded:
      startFiltrationForRecord(photoDetails: photoDetails, indexPath: indexPath)
    default:
      NSLog("do nothing")
    }
  }
  
  fileprivate func startDownloadForRecord(photoDetails: PhotoRecord, indexPath: IndexPath){
    if let _ = pendingOperations.downloadsInProgress[indexPath] {
      return
    }
    
    let downloader = ImageDownloader(photoRecord: photoDetails)
    
    downloader.completionBlock = {
      if downloader.isCancelled {
        return
      }
      DispatchQueue.main.async {
        self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
        self.tableView.reloadRows(at: [indexPath], with: .fade)
      }
    }
    
    pendingOperations.downloadsInProgress[indexPath] = downloader
    pendingOperations.downloadQueue.addOperation(downloader)
  }
  
  fileprivate func startFiltrationForRecord(photoDetails: PhotoRecord, indexPath: IndexPath){
    if let _ = pendingOperations.filtrationsInProgress[indexPath]{
      return
    }
    
    let filterer = ImageFiltration(photoRecord: photoDetails)
    filterer.completionBlock = {
      if filterer.isCancelled {
        return
      }
      DispatchQueue.main.async {
        self.pendingOperations.filtrationsInProgress.removeValue(forKey: indexPath)
        self.tableView.reloadRows(at: [indexPath], with: .fade)
      }
    }
    pendingOperations.filtrationsInProgress[indexPath] = filterer
    pendingOperations.filtrationQueue.addOperation(filterer)
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
      
    if cell.accessoryView == nil {
        let indicator = UIActivityIndicatorView(style: .medium)
        cell.accessoryView = indicator
    }
    let indicator = cell.accessoryView as! UIActivityIndicatorView
    
    let photoDetails = photos[indexPath.row]
    
    cell.textLabel?.text = photoDetails.name
    cell.imageView?.image = photoDetails.image
    
    switch (photoDetails.state){
    case .Filtered:
      indicator.stopAnimating()
    case .Failed:
      indicator.stopAnimating()
      cell.textLabel?.text = "Failed to load"
    case .New, .Downloaded:
      indicator.startAnimating()
      if (!tableView.isDragging && !tableView.isDecelerating) {
        self.startOperationsForPhotoRecord(photoDetails: photoDetails,indexPath: indexPath)
      }
    }
    return cell
  }
  
  override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    suspendAllOperations()
  }
  
  override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if !decelerate {
      loadImagesForOnscreenCells()
      resumeAllOperations()
    }
  }
  
  override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    loadImagesForOnscreenCells()
    resumeAllOperations()
  }
  
  fileprivate func suspendAllOperations () {
    pendingOperations.downloadQueue.isSuspended = true
    pendingOperations.filtrationQueue.isSuspended = true
  }
  
  fileprivate func resumeAllOperations () {
    pendingOperations.downloadQueue.isSuspended = false
    pendingOperations.filtrationQueue.isSuspended = false
  }
  
  fileprivate func loadImagesForOnscreenCells () {
    if let pathsArray = tableView.indexPathsForVisibleRows {
      
      var allPendingOperations = Set(pendingOperations.downloadsInProgress.keys)
      allPendingOperations = allPendingOperations.union(pendingOperations.filtrationsInProgress.keys)
      
      // get cells should cancel operations
      var toBeCancelled = allPendingOperations
      let visiblePaths = Set(pathsArray)
      toBeCancelled.subtract(visiblePaths)
      
      // get cells should be started as new
      var toBeStarted = visiblePaths
      toBeStarted.subtract(allPendingOperations)
      
      // cancel download and filter operations for unvisible cells
      for indexPath in toBeCancelled {
        if let pendingDownload = pendingOperations.downloadsInProgress[indexPath] {
          pendingDownload.cancel()
        }
        pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
        if let pendingFiltration = pendingOperations.filtrationsInProgress[indexPath] {
          pendingFiltration.cancel()
        }
        pendingOperations.filtrationsInProgress.removeValue(forKey: indexPath)
      }
      
      // start operation for new visible cells
      for indexPath in toBeStarted {
        let recordToProcess = self.photos[indexPath.row]
        startOperationsForPhotoRecord(photoDetails: recordToProcess, indexPath: indexPath)
      }
    }
  }
}
