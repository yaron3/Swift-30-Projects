import SwiftUI
import WeatherKit

struct WeatherView: View {
    @State private var city = "San Francisco"
    @State private var country = "U.S."
    @State private var weather = ""
    @State private var temperature = ""
    @State private var showingLocationPicker = false
    
    var body: some View {
        ZStack {
           // Color.black.edgesIgnoringSafeArea(.all)
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                //.opacity(0.3)
            
            NavigationStack {
                VStack(spacing: 20) {
                    Text(city)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(country)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    if !weather.isEmpty {
                        Text(weather.capitalized)
                            .font(.title3)
                            .padding()
                    }
                    
                    if !temperature.isEmpty {
                        Text("\(temperature)°")
                            .font(.system(size: 70))
                            .bold()
                    }
                    
                    Button(action: {
                        showingLocationPicker = true
                    }) {
                        Text("Change Location")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .navigationTitle("Weather")
                .sheet(isPresented: $showingLocationPicker) {
                    LocationPickerView(selectedCity: $city, selectedCountry: $country, weather: $weather, temperature: $temperature)
                }
                .onAppear {
                    displayCurrentWeather()
                }
            }
        }
    }
    
    private func displayCurrentWeather() {
        weather = ""
        temperature = ""
        
        WeatherService.sharedWeatherService().getCurrentWeather(city + "," + country) { data in
            if let weatherData = data {
                weather = weatherData.weather
                temperature = String(weatherData.temperature)
            }
        }
    }
}

#Preview {
    WeatherView()
}
