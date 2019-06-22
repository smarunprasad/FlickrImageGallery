//
//  FlickrLargeListCollectionViewCell.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class FlickrLargeListCollectionViewCell: UICollectionViewCell {

    static let identifier = "FlickrLargeListCollectionViewCell"

    @IBOutlet weak var feedImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWithData(flickrFeed: FlickrFeed) {
        
        //feed image
        feedImageView.download(urlString: flickrFeed.media.imageURL!, placholderImage: UIImage.init(named: Constants.image.no_feed_image)!) { (success) in
        }
    }
}
