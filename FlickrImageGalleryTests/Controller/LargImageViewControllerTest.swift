//
//  LargImageViewControllerTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class LargImageViewControllerTest: XCTestCase {
    
    override func setUp() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LargeImageViewController") as? LargeImageViewController
        viewController?.selectedIndex = 0
        viewController?.flickrFeed = FlickrListDatasourceTest().mokeData()
        viewController?.loadViewIfNeeded()
        
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
        // Test and Load the View at the Same Time!
        XCTAssertNotNil(viewController, "viewController should not be nil")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
