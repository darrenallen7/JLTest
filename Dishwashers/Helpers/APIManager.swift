//
//  APIManager.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import UIKit




class APIManager
{
    struct Constants
    {
        static let baseURL: String = "https://api.johnlewis.com"
        static let listingPathFormat: String = "/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=%i"
        static let pageSize: Int = 20
    }
    
    static let sharedInstance = APIManager()
}
