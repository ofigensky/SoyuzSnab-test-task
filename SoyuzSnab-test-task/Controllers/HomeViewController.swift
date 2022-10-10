
import UIKit

final class HomeViewController: UIViewController {
    
    private var citiesWeather: [String : [WeatherDataModel]] = [String : [WeatherDataModel]]()  {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var cities = ["Moscow", "Vladivostok", "Novosibirsk", "Yekaterinburg", "Kazan", "Irkutsk", "Chelyabinsk", "Krasnoyarsk", "Samara", "Ufa", "Rostov-on-Don", "Omsk", "Krasnodar", "Voronezh", "Perm", "Volgograd", "Saratov", "Tyumen", "Tolyatti", "Barnaul"]


    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        for city in cities { // refactor to func
            APICaller.shared.getData(cityName: city) { result in
                switch result {
                case .success(let data):
                    self.citiesWeather[city] = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeather.count / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        
        let firstCity = cities[indexPath.row]
        let secondCity = cities[indexPath.row + 10]
        let firstCityWeather = citiesWeather[firstCity]
        let test = firstCityWeather?[0].description
        cell.delegate = self
        cell.configure(.init(firstCityName: firstCity, secondCityName: secondCity, test: test ?? ""))
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
    
    func firstCityButtonTapped(completion: @escaping () -> String) {
        let name = completion()
        if let value = citiesWeather[name] {
            FavouriteService.shared.addToFavourite(name: name, weatherParam: value)
        }
    }
    
    func secondCityButtonTapped(completion: @escaping () -> String) {
        let name = completion()
        if let value = citiesWeather[name] {
            FavouriteService.shared.addToFavourite(name: name, weatherParam: value)
        }
    }
}
