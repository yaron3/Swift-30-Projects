import Foundation

class SharedData {
    static let shared = SharedData()
    
    // App Group identifier - you'll need to set this up in Xcode
    private let appGroupIdentifier = "group.com.yourcompany.weatherdemo"
    
    // Keys for UserDefaults
    private let cityKey = "selectedCity"
    private let countryKey = "selectedCountry"
    
    // Default values
    private let defaultCity = "San Francisco"
    private let defaultCountry = "U.S."
    
    // UserDefaults for the app group
    private var userDefaults: UserDefaults? {
        return UserDefaults(suiteName: appGroupIdentifier)
    }
    
    // MARK: - City and Country
    
    var city: String {
        get {
            return userDefaults?.string(forKey: cityKey) ?? defaultCity
        }
        set {
            userDefaults?.set(newValue, forKey: cityKey)
            userDefaults?.synchronize()
            NotificationCenter.default.post(name: Notification.Name("LocationChanged"), object: nil)
        }
    }
    
    var country: String {
        get {
            return userDefaults?.string(forKey: countryKey) ?? defaultCountry
        }
        set {
            userDefaults?.set(newValue, forKey: countryKey)
            userDefaults?.synchronize()
            NotificationCenter.default.post(name: Notification.Name("LocationChanged"), object: nil)
        }
    }
    
    // MARK: - Location String
    
    var locationString: String {
        return "\(city), \(country)"
    }
    
    // MARK: - Reset to Defaults
    
    func resetToDefaults() {
        city = defaultCity
        country = defaultCountry
    }
} 