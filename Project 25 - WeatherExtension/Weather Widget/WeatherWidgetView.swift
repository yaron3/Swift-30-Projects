import SwiftUI
import WidgetKit
import WeatherKit

struct WeatherWidgetView: View {
    let location: String
    @State private var weather: String = ""
    @State private var temperature: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack {
                if !weather.isEmpty {
                    Text(weather.capitalized)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if !temperature.isEmpty {
                    Text("\(temperature)°")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            displayCurrentWeather()
        }
    }
    
    private func displayCurrentWeather() {
        WeatherService.sharedWeatherService().getCurrentWeather(location) { data in
            if let weatherData = data {
                weather = weatherData.weather
                temperature = String(weatherData.temperature)
            }
        }
    }
}

#if DEBUG
struct WeatherWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView(location: "San Francisco, U.S.")
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif 