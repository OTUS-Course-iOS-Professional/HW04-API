//
// WeatherState.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum WeatherState: String, Codable, CaseIterable {
    case snow = "Snow"
    case sleet = "Sleet"
    case hail = "Hail"
    case thunderstorm = "Thunderstorm"
    case heavyRain = "Heavy Rain"
    case lightRain = "Light Rain"
    case showers = "Showers"
    case heavyCloud = "Heavy Cloud"
    case lightCloud = "Light Cloud"
    case clear = "Clear"
}
