//
//  Untitled.swift
//  WeatherAppSwiftUI
//
//  Created by Sharky on 3/1/25.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current=relative_humidity_2m&forecast_days=1&current=temperature_2m&current=rain&current=weather_code&current=wind_speed_10m&current=cloud_cover")
        else {
            fatalError("Invalid URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            print("response: \(response)")
            
            let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
            return decodedData
        } catch {
            print("Error fetching or decoding weather data: \(error.localizedDescription)")
            throw error
        }
    }
}

