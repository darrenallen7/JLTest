//
//  LoadingOverlay.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import Foundation
import UIKit

public class LoadingOverlay{
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView) {
        
        overlayView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor(white: 0x444444, alpha: 0.7)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        
        view.addSubview(overlayView)
        overlayView.addSubview(activityIndicator)
        view.bringSubview(toFront: overlayView)
        
        activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func hideOverlayView() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.activityIndicator.stopAnimating()
            self.overlayView.removeFromSuperview()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }
}

