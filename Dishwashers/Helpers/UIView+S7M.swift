//
//  UIView+S7M.swift
//  Dishwashers
//
//  Created by Darren Allen on 19/06/2018.
//  Copyright © 2018 Swift7Media. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    public func constrainView(toView:UIView, withEdgeInsets insets: UIEdgeInsets)
    {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
            self.rightAnchor.constraint(equalTo: toView.rightAnchor, constant: -insets.right),
            self.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom),
            self.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: insets.left)
            ])
    }
}
