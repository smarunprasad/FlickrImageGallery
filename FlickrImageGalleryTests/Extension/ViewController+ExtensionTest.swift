//
//  ViewController+ExtensionTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class ViewController_ExtensionTest: XCTestCase {

    var viewcontroller: UIViewController!
    
    override func setUp() {
        
        viewcontroller = getTopViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        viewcontroller = nil
        getTopViewController().dismiss(animated: true, completion: nil)
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getTopViewController() -> UIViewController {
        
        return UIApplication.shared.keyWindow?.rootViewController ?? UIViewController()
    }
    func presentErrorDialogue() {
        
        viewcontroller.showAlert(title: Constants.AppName.appName, message: "testing", OkButtonBlock: {
            XCTAssertTrue(true)
        }, cancelTitle: Constants.Keys.cancel, cancelBlock: {
            XCTAssertTrue(true)
        })
    }
    
    func testshowAlertControllerMethode() {
        
        self.presentErrorDialogue()
        let expectation = XCTestExpectation(description: "testshowAlertControllerMethode")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            
            XCTAssertTrue(self.viewcontroller.presentedViewController is UIAlertController)
            let aAlertController: UIAlertController = self.viewcontroller.presentedViewController as? UIAlertController ?? UIAlertController()
            
            XCTAssertEqual(aAlertController.title, Constants.AppName.appName)
            XCTAssertEqual(aAlertController.message, "testing")
            XCTAssertNotNil(aAlertController.actions[0])
            
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.5)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
