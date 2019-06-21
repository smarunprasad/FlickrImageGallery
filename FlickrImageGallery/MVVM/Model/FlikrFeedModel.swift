//
//  FlikrFeedModel.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 21/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation


struct FlickrFeedModel: Codable {
    
    var flickrFeed: [FlickrFeed]!
    
    enum CodingKeys: String, CodingKey  {
        case flickrFeed = "items"
    }
}

struct FlickrFeed: Codable {
    
    var title: String!
    var media: Media!
    var published: String!
    var author: String!
    var author_id: String!
    var tags: String!
}

struct Media: Codable {
    
    var imageURL: String!
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "m"
    }
}
