
import Foundation

final class FavouriteService {
    var citiesWeather: [String : [WeatherDataModel]] = [:]
    var favouriteWeather: [String : [WeatherDataModel]] = [:]
    var favouriteCities: [String] = []
    static var shared = FavouriteService()
    private init() {}
    
    func addToFavourite(name: String, weatherParam: [WeatherDataModel]) {
        favouriteWeather[name] = weatherParam
        if !favouriteCities.contains(name) {
            favouriteCities.append(name)
        }
    }
}
