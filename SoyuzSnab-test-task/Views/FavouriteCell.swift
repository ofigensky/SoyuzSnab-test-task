
import Foundation
import UIKit

final class FavouriteCell: UITableViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSubviews() {
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(weatherLabel)
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: topAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            weatherLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
        ])
    }
}

extension FavouriteCell {
    struct ViewState {
        let name: String
        let text: String
    }
    
    func configure(_ viewState: ViewState) {
        cityNameLabel.text = viewState.name
        weatherLabel.text = viewState.text
    }
}
