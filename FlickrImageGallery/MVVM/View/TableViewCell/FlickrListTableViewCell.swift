//
//  FlickrListTableViewCell.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class FlickrListTableViewCell: UITableViewCell {

    static let identifier = "FlickrListTableViewCell"
    
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWithData(flickrFeed: FlickrFeed) {
        
        //set the value to the outlets
        authorNameLabel.text = flickrFeed.author
        postedDateLabel.text = flickrFeed.published
        feedTitleLabel.text = flickrFeed.title

    }
}
