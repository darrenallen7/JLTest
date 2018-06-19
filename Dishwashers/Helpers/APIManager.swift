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
        static let listingPathFormat: String = "%@/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=%i"
        static let pageSize: Int = 20
    }
    
    static let sharedInstance = APIManager()
    
    func retrieveProducts(completion: @escaping (_ products: [Product]?, _ totalCount: Int?,  _ error: Error?) -> Void)
    {
        let urlString = buildURLString()
        guard let productURL = URL(string: urlString) else { return }
        
        let request = URLRequest(url: productURL)
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data,response,error in
            do {
                if let returnedData = data
                {
                    let products = try JSONDecoder().decode(Products.self, from: returnedData).products
                    let count = try JSONDecoder().decode(Products.self, from: returnedData).results
                    completion(products, count, nil)
                }
            } catch let error {
                print(error.localizedDescription)
                completion(nil, nil, error)
            }
        }
        dataTask.resume()
        
    }
    
    
    func buildURLString(withProductID productID: String? = nil) -> String
    {
        if productID == nil
        {
            return String(format: Constants.listingPathFormat, Constants.baseURL, Constants.pageSize)
        }
        else
        {
        }
        return ""
    }
}
