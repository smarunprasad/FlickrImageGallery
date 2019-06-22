//
//  FlickrViewModel.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

class FlickrViewModel {
    
    var reloadDataBlock: (() -> Void) = {
        
    }
    
    var alertDelegate: AlertDelegate?
    var flickrFeedModel: FlickrFeedModel!
    
}
extension FlickrViewModel {
    
    func getDataFromService() {
        
        self.flickrFeedModel = FlickrFeedModel()
        //callback block for the API call
        loadDatafromService { (_ model) in
            
            // If the flickr feed have the proper values then set it to the flikrFeedModel object
            if model.flickrFeed != nil && model.flickrFeed.isEmpty == false {
                
                self.flickrFeedModel = model
            }
            // call back block for the view controller
            self.reloadDataBlock()
        }
    }

    private func loadDatafromService(completionBlock: @escaping (FlickrFeedModel) -> Void) {
        
        //Checking Network connection
        if !(APIManager.isConnectedToNetwork()) {
            
            //Show Alert if there is no network connection
            self.alertDelegate?.showOkButtonAlert(message: Constants.Message.noInternet, completionBlock: {
                self.reloadDataBlock()
            })
        }
        else {
            
            APIManager.getPublicFeeds { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    // If response.flickrFeed containst value then pass the value
                    if response.flickrFeed != nil && response.flickrFeed.isEmpty == false {
                        
                        completionBlock(response)
                    }
                    else {
                        
                        // If response.flickrFeed is not contains value then pass empty and show alert
                        completionBlock(FlickrFeedModel())
                        self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                        })
                    }
                    break
                case .failure:
                    
                    // If response.flickrFeed is not contains value then pass empty and show alert
                    completionBlock(FlickrFeedModel())
                    self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                    })
                    
                    break
                }
            }
        }
    }
}
