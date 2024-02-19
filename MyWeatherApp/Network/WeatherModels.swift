//
//  WeatherModels.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Double
    let humidity: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
