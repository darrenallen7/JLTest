//
//  UIImageView+S7M.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromServerURL(url: URL) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}

