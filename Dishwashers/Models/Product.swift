//
//  Product.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import UIKit


struct Products: Codable {
    var products: [Product]
}

struct Product: Codable {
    var productId: String
    var price: Price
    var title: String
    var image: URL
}

struct Price: Codable {
    var was: String
    var then1: String
    var then2: String
    var now: String
    var uom: String
    var currency: String
}
