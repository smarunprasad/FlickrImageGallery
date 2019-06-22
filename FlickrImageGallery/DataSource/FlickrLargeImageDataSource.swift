//
//  FlickrLargeImageDataSource.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class FlickrLargeImageDataSource: NSObject, UICollectionViewDataSource {
    
    var flickrFeed = [FlickrFeed]()
    
    var changeTitle: ((_ string: String) -> Void) = {_ in 
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flickrFeed.isEmpty == false ? flickrFeed.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrLargeListCollectionViewCell.identifier, for: indexPath) as? FlickrLargeListCollectionViewCell
        
        if flickrFeed[indexPath.item].author.contains("\"") {
            
            let str = String(flickrFeed[indexPath.item].author.split(separator: "\"")[1]).dropLast()
            changeTitle(String(str))
        }
        else {
            changeTitle(flickrFeed[indexPath.item].author)
        }
        
        // Passing the value to cell
        aCell?.setupCellWithData(flickrFeed: flickrFeed[indexPath.item])
        return aCell!
    }
}
