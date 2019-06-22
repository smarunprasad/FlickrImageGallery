//
//  FlickrListDatasourceTest.swift
//  FlickrImageGalleryTests
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import FlickrImageGallery

class FlickrListDatasourceTest: XCTestCase {

    var datasource = FlickrListDataSource()
    var collectionView: UICollectionView? = nil
    
    override func setUp() {
        
        self.collectionView?.dataSource = datasource
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let size = CGRect(x: 0, y: 0, width: 100, height: 100)
        collectionView = UICollectionView(frame: size, collectionViewLayout: layout)

        datasource.flickrFeed = mokeData()
        self.collectionView?.register(UINib.init(nibName: FlickrListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FlickrListCollectionViewCell.identifier)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
        datasource = FlickrListDataSource()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(datasource.flickrFeed, "DataSource should have correct number of flickrFeed")
    }
    
    
    func testNumberOfRows() {
        
        let numberOfRows = datasource.collectionView(collectionView!, numberOfItemsInSection: 0)
        XCTAssertEqual(numberOfRows, 1, "Number of rows in collectionView should match number of results")
    }
    
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        viewController.loadViewIfNeeded()
        
        
        let cell = datasource.collectionView(collectionView!, cellForItemAt: IndexPath.init(item: 0, section: 0)) as? FlickrListCollectionViewCell
        XCTAssertEqual(cell?.authorName.text, "monica girard", "The authorName should display the same name")
    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        viewController.loadViewIfNeeded()
        
        let cell = datasource.collectionView(collectionView!, cellForItemAt: IndexPath.init(item: 0, section: 0)) as? FlickrListCollectionViewCell

        XCTAssertNotNil(cell, "collectionView should be able to dequeue cell with identifier: 'FlickrListCollectionViewCell'")
    }

    func mokeData()-> [FlickrFeed] {
    
        
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
                return json.flickrFeed
            }
            catch {
                print(error)
            }
        }
        return [FlickrFeed]()
    
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
