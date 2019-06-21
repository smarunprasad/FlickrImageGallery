//
//  FlickrListDataSource.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class FlickrListDataSource: NSObject, UITableViewDataSource {
    
    var flickrFeed = [FlickrFeed]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flickrFeed.isEmpty == false ? (section == 3) ? 2 : 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let aCell = tableView.dequeueReusableCell(withIdentifier: FlickrListTableViewCell.identifier) as? FlickrListTableViewCell
            
            // Passing the value to cell
            aCell?.setupCellWithData(flickrFeed: flickrFeed[indexPath.row])
            return aCell!
            
    }
}
