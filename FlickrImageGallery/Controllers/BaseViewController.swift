//
//  BaseViewController.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

protocol AlertDelegate {
    
    func showOkButtonAlert(message: String, completionBlock: @escaping ()-> Void)
}

//Created to write the comman function for the application
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
}

extension BaseViewController: AlertDelegate {
    
    func showOkButtonAlert(message: String, completionBlock: @escaping () -> Void) {
        
        self.showAlert(title:Constants.AppName.appName, message: message, OkButtonBlock: {
            completionBlock()
        })
    }
}
