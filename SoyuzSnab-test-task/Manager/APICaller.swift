//
//  NetworkManager.swift
//  SoyuzSnab-test-task
//
//  Created by Gleb Glushok on 06.10.2022.
//https://api.openweathermap.org/data/2.5/weather?appid=INSERT YOUR KEY HERE&units=metric
////
// chrom https://api.openweathermap.org/data/2.5/weather?appid=b29f575d40bb6530ee374c0132ed18f0&units=metric&q=Moscow
//

import Foundation

struct WeatherDataModel: Identifiable, Decodable {
    public let id: Int
    public let main, description, icon: String
    public let count = 20
}

struct MainWeatherDataModel: Identifiable, Decodable {
    let id: Int
    let weather: [WeatherDataModel]?
}

struct Constants {
    static let API_KEY = "b29f575d40bb6530ee374c0132ed18f0"
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(API_KEY)&units=metric&q=" // + cityName
}
class APICaller {
    
    static let shared = APICaller()
    func getData(cityName: String, completion: @escaping(Result<[WeatherDataModel], Error>) -> Void) {
        guard let url = URL(string: (Constants.baseURL + cityName)) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(MainWeatherDataModel.self, from: data)
                if let weather = results.weather {
                    completion(.success(weather))
                } else {
                    completion(.success([]))
                }
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
