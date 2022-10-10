//
//  CollectionViewCell.swift
//  SoyuzSnab-test-task
//
//  Created by Gleb Glushok on 06.10.2022.
//

import Foundation
import UIKit

class FavouriteCell: UITableViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

extension FavouriteCell {
    struct ViewState {
        let text: String
    }
    
    func configure(_ viewState: ViewState) {
        label.text = viewState.text
    }
}
