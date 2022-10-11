
import Foundation

final class FavouriteService {
    var favouriteWeather: [String : [WeatherDataModel]] = [:]
    var favouriteTemp: [String : Main] = [:]
    var favouriteWind: [String : Wind] = [:]
    var favouriteCities: [String] = []
    static var shared = FavouriteService() //Singleton for adding and deleting data from FavouriteViewController
    
    func addToFavourite(name: String, weatherParam: [WeatherDataModel], weatherTemp: Main, weatherWind: Wind) {
        favouriteWeather[name] = weatherParam
        favouriteTemp[name] = weatherTemp
        favouriteWind[name] = weatherWind
        if !favouriteCities.contains(name) {
            favouriteCities.append(name)
        }
    }
    
    func removeFromFavourite(name: String) {
        favouriteWeather[name] = nil
        favouriteTemp[name] = nil
        favouriteWind[name] = nil
        favouriteCities.removeAll { $0 == name }
    }
}
