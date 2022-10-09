//
//  DataModel.swift
//  SoyuzSnab-test-task
//
//  Created by Gleb Glushok on 06.10.2022.
//

import Foundation


struct WeatherDataModel: Identifiable, Decodable {
    let id: Int
    let main, description, icon: String
}

struct MainWeatherDataModel: Identifiable, Decodable {
    let id: Int
    let weather: [WeatherDataModel]?
}
