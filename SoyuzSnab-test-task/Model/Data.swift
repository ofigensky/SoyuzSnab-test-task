
import Foundation


struct WeatherDataModel: Identifiable, Decodable {
    let id: Int
    let main, description, icon: String
}

struct MainWeatherDataModel: Identifiable, Decodable {
    let id: Int
    let weather: [WeatherDataModel]?
}
