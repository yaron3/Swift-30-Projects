//
//  Photo.swift
//  RWDevCon
//
//  Created by Mic Pringle on 04/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    let caption: String
    let comment: String
    let imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        if let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist") {
            if let photosFromPlist = NSArray(contentsOf: URL) {
                for dictionary in photosFromPlist {
                    let dict = dictionary as! NSDictionary
                    let photo = Photo(
                        caption: dict["Caption"] as! String,
                        comment: dict["Comment"] as! String,
                        imageName: dict["Photo"] as! String
                    )
                    photos.append(photo)
                }
            }
        }
        return photos
    }
}
