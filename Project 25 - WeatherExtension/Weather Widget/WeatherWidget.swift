import WidgetKit
import SwiftUI
import WeatherKit

struct WeatherWidget: Widget {
    private let kind = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherWidgetProvider()) { entry in
            WeatherWidgetView(location: entry.location)
                .containerBackground(.clear, for: .widget)
        }
        .configurationDisplayName("Weather Widget")
        .description("Shows the current weather for your selected location.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct WeatherWidgetEntry: TimelineEntry {
    let date: Date
    let location: String
    let weather: String
    let temperature: String
}

struct WeatherWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherWidgetEntry {
        let sharedDefaults = UserDefaults(suiteName: "group.com.yaronj.weather.shared")
        let location = sharedDefaults?.string(forKey: "location") ?? "San Francisco, U.S."
        return WeatherWidgetEntry(date: Date(), location: location, weather: "Sunny", temperature: "22°")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherWidgetEntry) -> Void) {
        let sharedDefaults = UserDefaults(suiteName: "group.com.yaronj.weather.shared")
        let location = sharedDefaults?.string(forKey: "location") ?? "San Francisco, U.S."
        let components = location.split(separator: ",").map(String.init)
        let city = components[0]
        
        WeatherService().getCurrentWeather(city) { currentWeather in
            let entry = WeatherWidgetEntry(
                date: Date(),
                location: location,
                weather: currentWeather?.weather ?? "?",
                temperature: currentWeather != nil ? "\(currentWeather!.temperature)°" : "--"
            )
            completion(entry)
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherWidgetEntry>) -> Void) {
        let sharedDefaults = UserDefaults(suiteName: "group.com.yaronj.weather.shared")
        let location = sharedDefaults?.string(forKey: "location") ?? "San Francisco, U.S."
        let components = location.split(separator: ",").map(String.init)
        let city = components[0]
        
        WeatherService().getCurrentWeather(city) { currentWeather in
            let entry = WeatherWidgetEntry(
                date: Date(),
                location: location,
                weather: currentWeather?.weather ?? "?",
                temperature: currentWeather != nil ? "\(currentWeather!.temperature)°" : "--"
            )
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
            completion(timeline)
        }
    }
}
