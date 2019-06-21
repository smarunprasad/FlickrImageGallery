//
//  UIimageView+Extension.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    // By using this methode we can download the image from url
    func download(urlString: String, placholderImage: UIImage = UIImage(), completionBlock: ((_ isSuccess: Bool) -> Void)? = nil) {
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            // The download has finished.
            if let e = error {
                
                DispatchQueue.main.async() {
                    self.image = placholderImage
                    completionBlock?(false)
                }
                print("Error downloading cat picture: \(e)")
            }
            else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async() {
                            self.image = image
                            completionBlock?(true)
                        }
                        return
                    }
                }
                
                DispatchQueue.main.async() {
                    self.image = placholderImage
                    completionBlock?(false)
                }
                print("Couldn't get response code for some reason")
            }
        }
        downloadPicTask.resume()
    }
}
