//
//  CollectionViewCell.swift
//  SoyuzSnab-test-task
//
//  Created by Gleb Glushok on 06.10.2022.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let cityName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
//    private let cellImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "")
//        return imageView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemMint
        contentView.addSubview(cityName)
//        contentView.addSubview(cellImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        cellImageView.frame = contentView.bounds
        cityName.frame = contentView.bounds 
    }
    
    public func configure(with model: String) {
        let model = model
        cityName.text = model
        print("MODEL IN COLECTIO VIEW CELL FROM CONFIGURE - \(model) -")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
