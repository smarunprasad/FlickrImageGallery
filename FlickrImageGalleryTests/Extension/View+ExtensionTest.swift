//
//  View+ExtensionTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class ViewExtensionTest: XCTestCase {

    var view: UIView!
    
    override func setUp() {
        
        view = UIView()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        view = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRoundView() {
        
        let radius = 2
        let aColor = UIColor.gray
        
        XCTAssertNotNil(view, "aView should not be nil")
        XCTAssertNotNil(radius, "radius should not be nil")
        XCTAssertNotNil(aColor, "aColor should not be nil")
        XCTAssertEqual(radius, 2, "radius should be equal to 2")
        
        view.roundCorner(radius: CGFloat(radius), borderColor: aColor)
        XCTAssertEqual(view.layer.cornerRadius , 2, "Radius should be equal to 2")
        XCTAssertEqual(view.layer.borderColor , aColor.cgColor, "border color should be equal to aColor")
    }
    
    func testLoadingIndicator() {
        
        view.showLoadingIndicator()
        XCTAssertNotNil(view.showLoadingIndicator())
        view.hideLoadingIndicator()
        XCTAssertNotNil(view.hideLoadingIndicator())
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
