
import Foundation
import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    
    var delegate: CollectionViewTableViewCellDelegate?
    
    private let firstCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstCityButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondCityButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let firstCityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstCityWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
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
        
        NSLayoutConstraint.activate([
            firstCityLabel.topAnchor.constraint(equalTo: topAnchor),
            firstCityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondCityLabel.topAnchor.constraint(equalTo: topAnchor),
            secondCityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstCityButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            firstCityButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstCityButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            secondCityButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            secondCityButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            secondCityButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            firstCityImage.topAnchor.constraint(equalTo: firstCityLabel.bottomAnchor, constant: 10),
            firstCityImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            firstCityWeatherLabel.topAnchor.constraint(equalTo: firstCityImage.bottomAnchor, constant: 10),
            firstCityWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}

extension CollectionViewTableViewCell {
    struct ViewState {
        let firstCityName: String
        let secondCityName: String
        let test: String

    }
    
    func configure(_ viewState: ViewState) {
        firstCityLabel.text = viewState.firstCityName
        secondCityLabel.text = viewState.secondCityName
        firstCityWeatherLabel.text = viewState.test
    }
}

protocol CollectionViewTableViewCellDelegate {
    func firstCityButtonTapped(completion: @escaping () -> String)
    func secondCityButtonTapped(completion: @escaping () -> String) 
}
