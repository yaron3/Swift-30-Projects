import SwiftUI

final class PersistencyManager {
    static let shared = PersistencyManager()
    
    private let fileManager = FileManager.default
    private let cache = NSCache<NSString, UIImage>()
    
    private var documentsPath: String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    private init() {
        // Configure cache limits
        cache.countLimit = 100 // Maximum number of images to keep in memory
        cache.totalCostLimit = 50 * 1024 * 1024 // 50 MB
    }
    
    func saveImage(_ image: UIImage, filename: String) {
        let path = (documentsPath as NSString).appendingPathComponent(filename)
        
        guard let data = image.pngData() else { return }
        
        do {
            try data.write(to: URL(fileURLWithPath: path), options: .atomic)
            // Cache the image after saving
            cache.setObject(image, forKey: filename as NSString)
        } catch {
            print("Error saving image: \(error.localizedDescription)")
        }
    }
    
    func getImage(_ filename: String) -> UIImage? {
        let path = (documentsPath as NSString).appendingPathComponent(filename)
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .uncachedRead)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}

enum PersistencyError: LocalizedError {
    case imageConversionFailed
    case saveFailed(Error)
    case loadFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .imageConversionFailed:
            return "Failed to convert image data"
        case .saveFailed(let error):
            return "Failed to save image: \(error.localizedDescription)"
        case .loadFailed(let error):
            return "Failed to load image: \(error.localizedDescription)"
        }
    }
}
