//
//  WeatherDataView.swift
//  WeatherAppSwiftUI
//
//  Created by Sharky on 3/1/25.
//

import SwiftUI

struct WeatherDataView: View {
    let weather: WeatherModel
    @State private var expandedField: String?

    var body: some View {
        ZStack {
            
            Color(hue: 0.649, saturation: 0.726, brightness: 0.876)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                
                VStack {
                    Text("Weather.App")
                        .bold()
                        .font(.title2)
                    
                    Image(systemName: weatherIcon(for: weather.current.weather_code))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.yellow)
                        .shadow(radius: 10)
                        .rotationEffect(.degrees(weather.current.weather_code == 3 ? 15 : 0))
                        .animation(.easeInOut(duration: 1.0), value: weather.current.weather_code)
                }

                
                VStack(alignment: .leading, spacing: 10) {
                    WeatherDetailRowView(
                        label: "Temperature",
                        value: "\(String(format: "%.1f", weather.current.temperature_2m)) °C",
                        icon: "thermometer",
                        isHighlighted: true,
                        isExpanded: expandedField == "Temperature",
                        description: "Temperature is a physical quantity that quantitatively expresses the attribute of hotness or coldness.",
                        onTap: { toggleExpanded(for: "Temperature") }
                    )
                    WeatherDetailRowView(
                        label: "Humidity",
                        value: "\(weather.current.relative_humidity_2m)%",
                        icon: "drop.fill",
                        isHighlighted: true,
                        isExpanded: expandedField == "Humidity",
                        description: "Humidity is the concentration of water vapor present in the air",
                        onTap: { toggleExpanded(for: "Humidity") }
                    )
                    WeatherDetailRowView(
                        label: "Rain",
                        value: "\(String(format: "%.1f", weather.current.rain)) mm",
                        icon: "cloud.rain.fill",
                        isHighlighted: false,
                        isExpanded: expandedField == "Rain",
                        description: "Rain is a atmospheric phenomenon of water droplets that have condensed from atmospheric water vapor and then fall under gravity.",
                        onTap: { toggleExpanded(for: "Rain") }
                    )
                    WeatherDetailRowView(
                        label: "Wind Speed",
                        value: "\(String(format: "%.1f", weather.current.wind_speed_10m)) km/h",
                        icon: "wind",
                        isHighlighted: false,
                        isExpanded: expandedField == "Wind Speed",
                        description: "Wind speed is a fundamental atmospheric quantity caused by air moving from high to low pressure.",
                        onTap: { toggleExpanded(for: "Wind Speed") }
                    )
                    WeatherDetailRowView(
                        label: "Cloud Cover",
                        value: "\(weather.current.cloud_cover)%",
                        icon: "cloud.fill",
                        isHighlighted: false,
                        isExpanded: expandedField == "Cloud Cover",
                        description: "Cloud cover refers to the fraction of the sky obscured by clouds on average when observed from a particular location.",
                        onTap: { toggleExpanded(for: "Cloud Cover") }
                    )
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(15)
                .shadow(radius: 5)
                
                AsyncImage(url: URL(string: "https://img.freepik.com/premium-vector/weather-climate-vocabulary-with-cute-cartoon-characters-kids_535862-1422.jpg?semt=ais_hybrid")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                }
                .padding(.top, 10)
            }
            .padding()
            .foregroundColor(.white)
        }
        .preferredColorScheme(.dark)
    }

    func weatherIcon(for code: Int) -> String {
        switch code {
        case 0: return "sun.max.fill"
        case 1: return "cloud.fill"
        case 2: return "cloud.sun.fill"
        case 3: return "cloud.rain.fill"
        default: return "questionmark.circle.fill"
        }
    }

    private func toggleExpanded(for field: String) {
        withAnimation(.easeInOut) {
            if expandedField == field {
                expandedField = nil
            } else {
                expandedField = field
            }
        }
    }
}


#Preview {
    WeatherDataView(weather: previewWeather)
}
