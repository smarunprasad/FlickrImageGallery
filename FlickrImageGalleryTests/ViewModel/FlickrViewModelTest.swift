//
//  FlickrViewModelTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class FlickrViewModelTest: XCTestCase {

   
    var viewModel: FlickrViewModel!
    override func setUp() {
        
        viewModel = FlickrViewModel()
        viewModel.flickrFeedModel = mokeData()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testloadDataMethode() {
        
      //  let expectation = XCTestExpectation(description: "testloadDataMethode")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            XCTAssertNotNil(self.viewModel.flickrFeedModel, "flickrFeedModel should not be nil")
            XCTAssertNotNil(self.viewModel.flickrFeedModel.flickrFeed, "flickrFeed should not be nil")
            XCTAssertGreaterThan(self.viewModel.flickrFeedModel.flickrFeed?.count ?? 0, 0, "flickrFeed should be greater than 0")
            
          //  expectation.fulfill()
        })
        
       // wait(for: [expectation], timeout: 10)
    }

    func mokeData()-> FlickrFeedModel {
        
        
        let jsonData = """
        {
        "title": "Uploads from everyone",
        "link": "https://www.flickr.com/photos/",
        "description": "",
        "modified": "2019-06-22T14:04:39Z",
        "generator": "https://www.flickr.com",
        "items": [
        {
        "title": " ",
        "link": "https://www.flickr.com/photos/monicagirard/48108325221/",
        "media": {
        "m": "https://live.staticflickr.com/65535/48108325221_8526649b4b_m.jpg"
        },
        "date_taken": "2018-12-19T11:50:55-08:00",
        "published": "2019-06-22T14:04:39Z",
        "author": "monica girard",
        "author_id": "66143078@N00",
        "tags": ""
        }
        ]
        }
        """
        
        
        if let data = jsonData.data(using: .utf8, allowLossyConversion: true) {
            
            do {
                let json = try JSONDecoder().decode(FlickrFeedModel.self, from: data)
                print(json)
                return json
            }
            catch {
                print(error)
            }
        }
        return FlickrFeedModel()
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
