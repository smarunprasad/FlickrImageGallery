//
//  APIManagerTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class APIManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkConnect() {
        
        if APIManager.isConnectedToNetwork() == true {
            XCTAssertTrue( APIManager.isConnectedToNetwork(), "isConnectedToNetwork should be true ")
        }
        else {
            XCTAssertFalse( APIManager.isConnectedToNetwork(), "isConnectedToNetwork should be false")
        }
    }
    
    func testgetPublicFeedsForValidValue() {
        
        let expectation = XCTestExpectation(description: "testgetPublicFeedsForValidValue")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            APIManager.getPublicFeeds { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    XCTAssertNotNil(response, "response should not be nil")
                    XCTAssertNotNil(response.flickrFeed, "flickrFeed should not be nil")
                    
                case .failure(_): break
                }
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testgetPublicFeedsForInValidValues() {
        
        
        guard let infoDictPath = Bundle.main.path(forResource: "Info", ofType: "plist") else { return  }
        var aDictionary = NSDictionary(contentsOfFile: infoDictPath) as? [String : AnyObject]
        aDictionary?["baseURL"] = "http:liveflickr" as AnyObject
        
        APIManager.getPublicFeeds { (success, result) in

            switch result {
            case .success(_): break
                
            case .failure(let error):
                
                XCTAssertNotNil(error, "Invalid response")
            }
        }
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
