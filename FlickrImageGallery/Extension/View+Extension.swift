//
//  View+Extension.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

var spinner : UIView?

extension UIView {
    
    //MARK - View
    func roundCorner(radius: CGFloat, borderColor color: UIColor) {
        
        layer.cornerRadius = radius
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        clipsToBounds = true
    }
    
    func showLoadingIndicator() {
        
        // Activity indicator will appear on the view
        let spinnerView = UIView.init(frame: self.bounds)
        spinnerView.backgroundColor = .white
        
        let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint.init(x: spinnerView.bounds.midX , y: spinnerView.bounds.midY)
        activityIndicator.color = UIColor.primaryColor()
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            self.addSubview(spinnerView)
        }
        
        spinner = spinnerView
    }
    
    func hideLoadingIndicator() {
        
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
}
