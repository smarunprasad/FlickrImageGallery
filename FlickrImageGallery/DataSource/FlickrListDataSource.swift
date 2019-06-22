//
//  FlickrListDataSource.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class FlickrListDataSource: NSObject, UICollectionViewDataSource {
  
    var flickrFeed = [FlickrFeed]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return flickrFeed.isEmpty == false ? flickrFeed.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrListCollectionViewCell.identifier, for: indexPath) as? FlickrListCollectionViewCell
        
        // Passing the value to cell
        aCell?.setupCellWithData(flickrFeed: flickrFeed[indexPath.item])
        return aCell!
    }
}
