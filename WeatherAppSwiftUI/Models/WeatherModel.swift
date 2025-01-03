//
//  WeatherModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sharky on 3/1/25.
//


struct WeatherModel: Decodable {
    var current: CurrentWeatherResponse
    
    struct CurrentWeatherResponse: Decodable {
        var relative_humidity_2m: Int
        var temperature_2m: Double
        var rain: Double
        var weather_code: Int
        var wind_speed_10m: Double
        var cloud_cover: Int
    }
}
