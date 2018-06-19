//
//  ProductDetails.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import Foundation
import UIKit

struct ProductDetails: Codable
{
    var title: String
    var media: Media
    var price: Price
    var details: Details
    var displaySpecialOffer: String
    var additionalServices: AdditionalServices
    var code: String
    
}


struct Media: Codable
{
    var images: Images
}

struct Images: Codable
{
    var altText: String
    var urls: [String]
}

struct Details: Codable
{
    var productInformation: String
}

struct AdditionalServices: Codable
{
    var includedServices: [String]
}
