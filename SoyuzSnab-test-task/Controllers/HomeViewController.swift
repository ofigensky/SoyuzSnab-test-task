
import UIKit

final class HomeViewController: UIViewController {
    
    private var citiesWeather: [String : [WeatherDataModel]] = [String : [WeatherDataModel]]()
    private var citiesTemp: [String : Main] = [String : Main]()
    private var citiesWind: [String : Wind] = [String : Wind]()
    private var cities = ["Moscow", "Vladivostok", "Novosibirsk", "Yekaterinburg", "Kazan", "Irkutsk", "Chelyabinsk", "Krasnoyarsk", "Samara", "Ufa", "Rostov-on-Don", "Omsk", "Krasnodar", "Voronezh", "Perm", "Volgograd", "Saratov", "Tyumen", "Tolyatti", "Barnaul"]


    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
    
    private let group = DispatchGroup() // used for parsing data. with group usage all data parsed and waiting for usage together

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) { // fetching data here because of ViewController life cycle
        super.viewWillAppear(animated)
        updateWeather()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func updateWeather() {
        for city in cities {
            group.enter()
            APICaller.shared.getWeather(cityName: city) { result in
                switch result {
                case .success(let data):
                    self.citiesWeather[city] = data // city is the key
                case .failure(let error):
                    print(error)
                }
                self.group.leave()

            }
            APICaller.shared.getTemp(cityName: city) { result in
                self.citiesTemp[city] = result
            }
            
            APICaller.shared.getWind(cityName: city) { result in
                self.citiesWind[city] = result
            }

        }
        group.notify(queue: .main) { // parsed data all together ready to use
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeather.count / 2 // making 2 columns
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        cell.delegate = self
        let firstCity = cities[indexPath.row]
        let secondCity = cities[indexPath.row + 10]
        let firstCityWeather = self.citiesWeather[firstCity]?[0].description
        let secondCityWeather = self.citiesWeather[secondCity]?[0].description
        let firstCityTemp = citiesTemp[firstCity]?.temp
        let secondCityTemp = citiesTemp[secondCity]?.temp
        let firstCityWind = citiesWind[firstCity]?.speed
        let secondCityWind = citiesWind[secondCity]?.speed
        let firstCityConditionId = citiesWeather[firstCity]?[0].id
        let secondCityConditionId = citiesWeather[secondCity]?[0].id

        cell.configure(.init(firstCityName: firstCity, secondCityName: secondCity, firstCityWeather: firstCityWeather ?? "", secondCityWeather: secondCityWeather ?? "", firstCityTemp: firstCityTemp!, secondCityTemp: secondCityTemp!, firstCityWind: firstCityWind!, secondCityWind: secondCityWind!, firstCityConditionId: firstCityConditionId!, secondCityConditionId: secondCityConditionId!)) // pass data to cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    
    func firstCityButtonTapped(completion: @escaping () -> String) { // passing data when button clicked 
        let name = completion()
        if let value = citiesWeather[name] {
            if let tempValue = citiesTemp[name] {
                if let windValue = citiesWind[name] {
                    FavouriteService.shared.addToFavourite(name: name, weatherParam: value, weatherTemp: tempValue, weatherWind: windValue)
                }
            }
        }
    }
    
    func secondCityButtonTapped(completion: @escaping () -> String) {
        let name = completion()
        if let value = citiesWeather[name] {
            if let tempValue = citiesTemp[name] {
                if let windValue = citiesWind[name] {
                    FavouriteService.shared.addToFavourite(name: name, weatherParam: value, weatherTemp: tempValue, weatherWind: windValue)
                }
            }
        }
    }
}
