//
//  UIImageView+Extensions.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import UIKit

extension UIImageView {
    func addActivityInidicator() {
        removeActivityIndicator()
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = center
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }

    func removeActivityIndicator() {
        for subview in subviews {
            if let activityIndicatorView = subview as? UIActivityIndicatorView {
                activityIndicatorView.removeFromSuperview()
            }
        }
    }
}
