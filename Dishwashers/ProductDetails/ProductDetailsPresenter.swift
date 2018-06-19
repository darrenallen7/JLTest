//
//  ProductDetailsPresenter.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright (c) 2018 Swift7Media. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import Foundation

protocol ProductDetailsPresenterInput
{
    func presentProductDetails(withDetails details: ProductDetails)
}

class ProductDetailsPresenter: ProductDetailsPresenterInput
{
    weak var output: ProductDetailsViewControllerInput?

    // MARK: - Presentation logic
    
    func presentProductDetails(withDetails details: ProductDetails)
    {
        output?.displayDetails(withProductDetails: details)
    }
}
