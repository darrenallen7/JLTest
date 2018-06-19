//
//  ProductCollectionViewCell.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell
{
    struct Constants
    {
        static let imageInset: CGFloat = 10
        static let labelInset: CGFloat = 10
    }
    var priceString: String = "" {
        didSet {
            let price = "£\(priceString)"
            priceLabel.text = price
        }
    }
    
    var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell()
    {
        productImage.autoresizingMask.insert(.flexibleHeight)
        productImage.autoresizingMask.insert(.flexibleWidth)
        
        contentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        contentView.addSubview(productImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.imageInset),
            productImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.imageInset),
            productImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.imageInset),
            productImage.heightAnchor.constraint(equalTo: productImage.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: Constants.labelInset),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.labelInset),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.labelInset),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.labelInset),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.labelInset),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.labelInset),
            ])
    }
    
    override func prepareForReuse()
    {
        productImage.image = nil
        nameLabel.text = nil
        priceLabel.text = nil
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
}
