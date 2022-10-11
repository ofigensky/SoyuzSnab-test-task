
import Foundation
import UIKit

final class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    var delegate: CollectionViewTableViewCellDelegate?
    
    private let firstCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstCityButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        button.setTitle("Save city", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondCityButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        button.setTitle("Save city", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var firstCityImage: UIImageView = {
        var imageView = UIImageView()
        imageView.tintColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var secondCityImage: UIImageView = {
        var imageView = UIImageView()
        imageView.tintColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstCityWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondCityWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstCityTemp: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondCityTemp: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstCityWind: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondCityWind: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtons() {
        firstCityButton.addTarget(self, action: #selector(firstCityButtonTapped), for: .touchUpInside)
        secondCityButton.addTarget(self, action: #selector(secondCityButtonTapped), for: .touchUpInside)
    }
    
    @objc private func firstCityButtonTapped() {
        delegate?.firstCityButtonTapped(completion: { self.firstCityLabel.text ?? ""})
    }
    
    @objc private func secondCityButtonTapped() {
        delegate?.secondCityButtonTapped(completion: { self.secondCityLabel.text ?? "" })
    }
    
    private func setupSubviews() {
        contentView.addSubview(firstCityLabel)
        contentView.addSubview(secondCityLabel)
        contentView.addSubview(firstCityButton)
        contentView.addSubview(secondCityButton)
        contentView.addSubview(firstCityWeatherLabel)
        contentView.addSubview(firstCityImage)
        contentView.addSubview(secondCityImage)
        contentView.addSubview(secondCityWeatherLabel)
        contentView.addSubview(firstCityTemp)
        contentView.addSubview(secondCityTemp)
        contentView.addSubview(firstCityWind)
        contentView.addSubview(secondCityWind)

        NSLayoutConstraint.activate([
            firstCityLabel.topAnchor.constraint(equalTo: topAnchor),
            firstCityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityLabel.topAnchor.constraint(equalTo: topAnchor),
            secondCityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstCityImage.topAnchor.constraint(equalTo: firstCityLabel.bottomAnchor, constant: 10),
            firstCityImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityImage.topAnchor.constraint(equalTo: secondCityLabel.bottomAnchor, constant: 10),
            secondCityImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstCityWeatherLabel.topAnchor.constraint(equalTo: firstCityImage.bottomAnchor, constant: 10),
            firstCityWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityWeatherLabel.topAnchor.constraint(equalTo: secondCityImage.bottomAnchor, constant: 10),
            secondCityWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstCityTemp.topAnchor.constraint(equalTo: firstCityWeatherLabel.bottomAnchor, constant: 10),
            firstCityTemp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityTemp.topAnchor.constraint(equalTo: secondCityWeatherLabel.bottomAnchor, constant: 10),
            secondCityTemp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstCityWind.topAnchor.constraint(equalTo: firstCityTemp.bottomAnchor, constant: 10),
            firstCityWind.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityWind.topAnchor.constraint(equalTo: secondCityTemp.bottomAnchor, constant: 10),
            secondCityWind.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstCityButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            firstCityButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondCityButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
    
        ])
    }
}

extension CollectionViewTableViewCell {
    struct ViewState {
        let firstCityName: String
        let secondCityName: String
        let firstCityWeather: String
        let secondCityWeather: String
        let firstCityTemp: Double
        let secondCityTemp: Double
        let firstCityWind: Double
        let secondCityWind: Double
        let firstCityConditionId: Int
        let secondCityConditionId: Int
        
        var firstCityCondition: String { // parsed ID converted to SF Symbols name and put in firstCityImage
            switch firstCityConditionId {
            case 200...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 800:
                return "sun.max"
            case 801:
                return "sun.min"
            case 802...803:
                return "cloud.sun"
            case 804:
                return "smoke"
            default:
                return "cloud"
            }
        }
        
        var secondCityCondition: String {
            switch secondCityConditionId {
            case 200...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 800:
                return "sun.max"
            case 801:
                return "sun.min"
            case 802...803:
                return "cloud.sun"
            case 804:
                return "smoke"
            default:
                return "cloud"
            }
        }
        var config = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold) // size of SF Symbol
    }
    
    func configure(_ viewState: ViewState) {
        firstCityLabel.text = viewState.firstCityName
        secondCityLabel.text = viewState.secondCityName
        firstCityWeatherLabel.text = viewState.firstCityWeather
        secondCityWeatherLabel.text = viewState.secondCityWeather
        firstCityTemp.text = viewState.firstCityTemp.toString() + " °C"
        secondCityTemp.text = viewState.secondCityTemp.toString() + " °C"
        firstCityWind.text = viewState.firstCityWind.toString() + " m/s"
        secondCityWind.text = viewState.secondCityWind.toString() + " m/s"
        firstCityImage.image = UIImage(systemName: viewState.firstCityCondition, withConfiguration: viewState.config)
        secondCityImage.image = UIImage(systemName: viewState.secondCityCondition, withConfiguration: viewState.config)
    }
}

protocol CollectionViewTableViewCellDelegate {
    func firstCityButtonTapped(completion: @escaping () -> String)
    func secondCityButtonTapped(completion: @escaping () -> String) 
}
