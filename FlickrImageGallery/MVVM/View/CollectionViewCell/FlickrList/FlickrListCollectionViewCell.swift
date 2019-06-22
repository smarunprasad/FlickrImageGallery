//
//  FlickerListCollectionViewCell.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class FlickrListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FlickrListCollectionViewCell"

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
        
        //Checked to show the author name only
        if flickrFeed.author.contains("\"") {
            
            let str = String(flickrFeed.author.split(separator: "\"")[1]).dropLast()
            authorName.text = String(str)
        }
        else {
            authorName.text = flickrFeed.author
        }
        publishedDate.text = flickrFeed.published.convertDateFormater()
        
        //feed image
        feedImageView.download(urlString: flickrFeed.media.imageURL!, placholderImage: UIImage.init(named: Constants.image.no_feed_image)!) { (success) in
        }
    }
}
