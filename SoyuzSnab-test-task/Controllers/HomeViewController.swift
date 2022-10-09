
import UIKit

enum Sections: Int {
    case NewWeather = 0
}

class HomeViewController: UIViewController {
    
    var citiesWeather: [String : [WeatherDataModel]] = [String : [WeatherDataModel]]()
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
//        fetchWithFor()
    }
    
//    func fetchWithFor() {
//        for city in cities {
//            fetchWeather(city)
//        }
//    }
//
//    func fetchWeather(_ name: String) {
//        APICaller.shared.getData(cityName: name) { result in
//            switch result {
//            case .success(let arr): self.citiesWeather[name] = arr
//                print("HOME VC \(name)fetchWeather \(arr)")
//            case .failure(let error): print(error)
//            }
//        }
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        
        switch indexPath.section {
        case Sections.NewWeather.rawValue:
            
            for city in cities {
              fetchWeather(city)
            }
            
            func fetchWeather(_ name: String) {
                APICaller.shared.getData(cityName: name) { result in
                    switch result {
                    case .success(let arr):
                        cell.configure(with: arr)
//                        print("HOME VC \(name) fetchWeather \(arr[indexPath.row].description)")
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            
            
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    
}
