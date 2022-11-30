//
//  CityNameEntity.swift
//  Weather
//
//  Created by Wellington on 15/11/22.
//

import Foundation

struct CityData: Codable {
    let name: String?
    let lat, lon: Double?
    let country, state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case lat, lon, country, state
    }
}
