//
//  ProductListingViewController.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright (c) 2018 Swift7Media. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ProductListingViewControllerInput: class
{
    func displayError(withTitle title: String, andMessage message: String)
    func displayProductList(withProducts products: [Product])
}

class ProductListingViewController: UIViewController, ProductListingViewControllerInput
{
    
    struct Constants {
        static let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 50.0, right: 20.0)
        static let itemsPerRow: CGFloat = 4
    }
    
    var output: ProductListingInteractorInput?
    var router: ProductListingRouter?
    
    var products: [Product]?
    var loadingOverlay = LoadingOverlay.shared
    
    var productCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        return collectionView
    }()

    // MARK: - View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        self.view.addSubview(productCollectionView)
        productCollectionView.constrainView(toView: self.view, withEdgeInsets: .zero)
        loadingOverlay.showOverlay(view: self.view)
        output?.getProducts()
    }
    
    func displayProductList(withProducts products: [Product])
    {
        self.products = products
        DispatchQueue.main.async {
            self.productCollectionView.reloadData()
            self.loadingOverlay.hideOverlayView()
        }
    }

    func displayError(withTitle title: String, andMessage message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        loadingOverlay.hideOverlayView()
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval)
    {
        self.productCollectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ProductListingViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let currentProduct = products?[indexPath.item] else { return UICollectionViewCell() }
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        
        productCell.nameLabel.text = currentProduct.title
        productCell.priceLabel.text = currentProduct.price.displayPrice()
        if let imageURL = currentProduct.displayImageURL()
        {
            productCell.productImage.imageFromServerURL(url: imageURL)
        }
        return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
}

extension ProductListingViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding = Constants.sectionInsets.left * (Constants.itemsPerRow + 1)
        let availableWidth = view.frame.width - padding
        let widthPerItem = availableWidth / Constants.itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem*1.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.sectionInsets.left
    }
}
