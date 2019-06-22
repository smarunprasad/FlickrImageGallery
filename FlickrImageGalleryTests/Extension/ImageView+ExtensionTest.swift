//
//  ImageView+ExtensionTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class ImageViewExtensionTest: XCTestCase {

    var imageView: UIImageView!
    
    override func setUp() {
        
        imageView  = UIImageView.init(frame: CGRect.zero)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testImageDownLoadForValidData() {
        
        let expectation = XCTestExpectation(description: "testImageDownLoadForValidData")
        
        DispatchQueue.main.asyncAfter(deadline: .now() , execute: {
            
            self.imageView.download(urlString: "https://live.staticflickr.com/65535/48108325221_8526649b4b_m.jpg", placholderImage: UIImage.init(named: Constants.image.no_profile_image)!) { (success) in
                XCTAssertEqual(success, true, "imageview contains the vaid image")
                
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
        
        
    }
    
    func testImageDownLoadForInValidValidData() {
        
        let expectation = XCTestExpectation(description: "testImageDownLoadForInValidValidData")
        
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            
            self.imageView.download(urlString: "https://livestaticflickr.com///", placholderImage: UIImage.init(named: Constants.image.no_profile_image)!) { (success) in
                XCTAssertEqual(success, false, "The url not contain the valid image")
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testImageDownLoadForEmptyData() {
        
        let expectation = XCTestExpectation(description: "testImageDownLoadForEmptyData")
        
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            
            self.imageView.download(urlString: "", placholderImage: UIImage.init(named: Constants.image.no_profile_image)!) { (success) in
                XCTAssertEqual(success, false, "The url is empty")
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
