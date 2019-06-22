//
//  ViewController.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    var flickrViewModel: FlickrViewModel!
    var flickrDataSource = FlickrListDataSource()
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = flickrDataSource
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        bindValueFromModel()
    }
    
    func setUpUI() {
        
        self.collectionView.register(UINib.init(nibName: FlikerListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FlikerListCollectionViewCell.identifier)
    }
    
    func bindValueFromModel() {
        
        self.view.showLoadingIndicator()
        
        // Init the view model to download the data fro the API and pass back to screen
        flickrViewModel = FlickrViewModel()

        //Setting the alert delegate to show the alert in Base view controller
        flickrViewModel.alertDelegate = self

        //get the data from the service
        flickrViewModel.getDataFromService()

        //callBack block to update the view
        flickrViewModel.reloadDataBlock = { [weak self] in
            
            // Pass the value to the datasouce and relode the table view
            if let flickerFeed = self?.flickrViewModel.flikrFeedModel.flickrFeed {
           
                self?.flickrDataSource.flickrFeed = flickerFeed
                self?.view.hideLoadingIndicator()
                
                DispatchQueue.main.async {
                    
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}

extension ViewController:UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize.init(width: self.view.frame.width/2 - 6, height: self.view.frame.width/2 - 6)
    }
}
