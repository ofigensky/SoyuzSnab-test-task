
import Foundation
import UIKit

final class FavouriteViewContoller: UIViewController {
    
    private var favouriteWeather: [String : [WeatherDataModel]] = [:] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var favouriteTemp: [String : Main] = [:] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var favouriteWind: [String : Wind] = [:] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavouriteCell.self, forCellReuseIdentifier: FavouriteCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favouriteWeather = FavouriteService.shared.favouriteWeather
        favouriteTemp = FavouriteService.shared.favouriteTemp
        favouriteWind = FavouriteService.shared.favouriteWind
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension FavouriteViewContoller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.identifier) as! FavouriteCell
        let name = FavouriteService.shared.favouriteCities[indexPath.row]
        let weather = FavouriteService.shared.favouriteWeather[name]?[0].description
        let temp = FavouriteService.shared.favouriteTemp[name]?.temp?.toString()
        let wind = FavouriteService.shared.favouriteWind[name]?.speed?.toString()
        let text = "\(name)\n \(weather!) \n \(temp!) °C\n \(wind!) m/s"
        cell.configure(.init(text: text))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            favouriteWeather.removeAll()
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

extension FavouriteViewContoller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
