
import Foundation



struct MainWeatherDataModel: Identifiable, Decodable {
    let id: Int
    let weather: [WeatherDataModel]?
    let main: Main
    let wind: Wind
}

struct WeatherDataModel: Identifiable, Decodable {
    let id: Int
    let main, description, icon: String
}

struct Main: Decodable {
    let temp: Double?
}

struct Wind: Decodable {
    let speed: Double?
}
