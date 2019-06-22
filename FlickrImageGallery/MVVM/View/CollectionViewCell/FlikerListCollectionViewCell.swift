//
//  FlickerListCollectionViewCell.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class FlikerListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FlikerListCollectionViewCell"

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.roundCorner(radius: 5, borderColor: UIColor.black.withAlphaComponent(0.3))
        // Initialization code
    }

    func setupCellWithData(flickrFeed: FlickrFeed) {
        
        //set the value to the outlets
        let str = String(flickrFeed.author.split(separator: "\"")[1]).dropLast()
        authorName.text = String(str)
        publishedDate.text = flickrFeed.published
        
        //feed image
        feedImageView.download(urlString: flickrFeed.media.imageURL!, placholderImage: UIImage.init(named: Constants.image.no_feed_image)!) { (success) in
        }
    }
}
