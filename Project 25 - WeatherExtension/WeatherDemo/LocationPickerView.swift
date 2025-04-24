import SwiftUI

struct LocationPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedCity: String
    @Binding var selectedCountry: String
    @Binding var weather: String
    @Binding var temperature: String
    
    let locations = ["Tel Aviv, Israel", "Paris, France", "Kyoto, Japan", "Sydney, Australia", "Seattle, U.S.", "New York, U.S.", "Hong Kong, Hong Kong", "Taipei, Taiwan", "London, U.K.", "Vancouver, Canada", "San Francisco, U.S."]
    
    var body: some View {
        
        NavigationView {
            List(locations, id: \.self) { location in
                let components = location.split(separator: ",").map(String.init)
                let city = components[0]
                let country = components[1].trimmingCharacters(in: .whitespaces)
                
                Button(action: {
                    selectedCity = city
                    selectedCountry = country
                    updateWeather()
                    dismiss()
                }) {
                    HStack {
                        Text(location)
                        Spacer()
                        if city == selectedCity && country == selectedCountry {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .foregroundColor(.primary)
            }
            .navigationTitle("Select Location")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
        }
    }
    
    private func updateWeather() {
        weather = ""
        temperature = ""
        
        WeatherService.sharedWeatherService().getCurrentWeather("\(selectedCity),\(selectedCountry)") { data in
            if let weatherData = data {
                weather = weatherData.weather
                temperature = String(weatherData.temperature)
            }
        }
    }
} 
