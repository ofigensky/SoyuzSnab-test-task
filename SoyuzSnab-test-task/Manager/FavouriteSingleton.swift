
import Foundation

final class FavouriteService {
    var citiesWeather: [String : [WeatherDataModel]] = [:]
    var favouriteWeather: [String : [WeatherDataModel]] = [:]
    var favouriteTemp: [String : Main] = [:]
    var favouriteWind: [String : Wind] = [:]
    var favouriteCities: [String] = []
    static var shared = FavouriteService()
    private init() {}
    
    func addToFavourite(name: String, weatherParam: [WeatherDataModel], weatherTemp: Main, weatherWind: Wind) {
        favouriteWeather[name] = weatherParam
        favouriteTemp[name] = weatherTemp
        favouriteWind[name] = weatherWind
        if !favouriteCities.contains(name) {
            favouriteCities.append(name)
        }
    }
}
