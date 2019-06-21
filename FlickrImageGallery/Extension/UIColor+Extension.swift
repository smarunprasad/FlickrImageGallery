//
//  UIColor+Extension.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func getColorFromHexa(aValue: String?) -> UIColor {
        
        guard let value = aValue else { return UIColor() }
        
        var hexSanitized = value.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt32 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        let a: CGFloat = 1.0
        
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return UIColor.lightGray }
        r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        b = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor.init(red: r, green: g, blue: b, alpha: a)
    }
    
    static func primaryColor() -> UIColor {
        
        return getColorFromHexa(aValue: Constants.Color.primaryColor)
    }
}
