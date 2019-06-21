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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = flickrDataSource
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        bindValueFromModel()
    }
    
    func setUpUI() {
        
        self.tableView.register(UINib.init(nibName: FlickrListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FlickrListTableViewCell.identifier)
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
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
                    
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

