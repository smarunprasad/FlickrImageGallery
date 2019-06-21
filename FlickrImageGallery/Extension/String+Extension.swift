//
//  String+Extension.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

extension String {
   
    func convertDateFormater() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"//1977-05-25T07:00:00Z
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = Constants.AppDateFormate.appDateFormate
        
        return  dateFormatter.string(from: date)
    }
}
