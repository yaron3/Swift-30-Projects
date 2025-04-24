import SwiftUI
import WidgetKit

struct WeatherWidgetView: View {
    let location: String
    @State private var weather: String = "Cloudy"
    @State private var temperature: String = "15"
    @State private var imageName: String = ""

    var body: some View {
        ZStack {
            Image($imageName.wrappedValue)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 4) {
                Text(location)
                    .font(.headline)
                    .foregroundColor(.primary)

                HStack {
                    if !weather.isEmpty {
                        Text($weather.wrappedValue)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                    }

                    Spacer()

                    if !temperature.isEmpty {
                        Text("\($temperature.wrappedValue)°")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.primary)
                    }
                }

            }
            .padding()
            .opacity(0.8)
        }
        .containerBackground(for: .widget) {
            Color.blue // Or Color.background if you want a fallback
        }
        .onAppear {
            displayCurrentWeather()
        }
    }

    private func displayCurrentWeather() {
        let components = location.split(separator: ",").map(String.init)
        let city = components[0]
        imageName = city.replacingOccurrences(of: " ", with: "-").lowercased() + "-widget"
        WeatherService.sharedWeatherService().getCurrentWeather(location) { data in
            if let weatherData = data {
                weather = weatherData.weather
                temperature = String(weatherData.temperature)
            }
        }
    }
}

// MARK: - Preview
struct WeatherWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherWidgetView(location: "San Francisco, U.S.")
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}

