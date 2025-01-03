//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Sharky on 3/1/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherModel?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weatherData = weather {
                    WeatherDataView(weather: weatherData)
                }
                else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch {
                                print("Error weather view: \(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                    }
                }
        }
        .background(Color(hue: 0.649, saturation: 0.726, brightness: 0.876))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
