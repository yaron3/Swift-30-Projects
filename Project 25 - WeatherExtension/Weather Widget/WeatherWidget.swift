import WidgetKit
import SwiftUI

struct WeatherWidget: Widget {
    private let kind = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherWidgetProvider()) { entry in
            WeatherWidgetView(location: entry.location)
        }
        .configurationDisplayName("Weather Widget")
        .description("Shows the current weather for your selected location.")
        .supportedFamilies([.systemSmall])
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
        WeatherWidgetEntry(date: Date(), location: "San Francisco, U.S.", weather: "Sunny", temperature: "22")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherWidgetEntry) -> Void) {
        let entry = WeatherWidgetEntry(date: Date(), location: "San Francisco, U.S.", weather: "Sunny", temperature: "22")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherWidgetEntry>) -> Void) {
        let location = "San Francisco, U.S."
        
        WeatherService.sharedWeatherService().getCurrentWeather(location) { data in
            let currentDate = Date()
            let entry: WeatherWidgetEntry
            
            if let weatherData = data {
                entry = WeatherWidgetEntry(
                    date: currentDate,
                    location: location,
                    weather: weatherData.weather,
                    temperature: String(weatherData.temperature)
                )
            } else {
                entry = WeatherWidgetEntry(
                    date: currentDate,
                    location: location,
                    weather: "Unknown",
                    temperature: "--"
                )
            }
            
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
            completion(timeline)
        }
    }
} 