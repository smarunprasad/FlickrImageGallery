//
//  LargeImageViewController.swift
//  FlickrImageGallery
//
//  Created by Arunprasat Selvaraj on 22/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class LargeImageViewController: BaseViewController {
    
    var flickrDataSource = FlickrLargeImageDataSource()
    var flickrFeed = [FlickrFeed]()
    var selectedIndex: Int!

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = flickrDataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        setupModel()
    }
    
    func setUpUI() {
        
        self.collectionView.register(UINib.init(nibName: FlickrLargeListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FlickrLargeListCollectionViewCell.identifier)
        setupLeftBarButton()
    }
    
    func setupModel() {
        
        flickrDataSource.flickrFeed = flickrFeed
        
        //To change the navigation bar title based on the indexpath
        flickrDataSource.changeTitle = { [weak self] (_ string: String) in
            self?.title = string
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            //To scroll the particular index if the flickrFeed contains count
            if !(self.flickrDataSource.flickrFeed.isEmpty) {
                
                self.collectionView.scrollToItem(at: IndexPath.init(item: self.selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
            }
        }
        
    }
    
    func setupLeftBarButton() {
        
        let barButton = UIBarButtonItem.init(barButtonSystemItem: .stop, target: self, action: #selector(leftBarButtonItem))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func leftBarButtonItem() {
        
        dismiss(animated: true, completion: nil)
    }
}

extension LargeImageViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        dismiss(animated: true, completion: nil)
        
    }
}
extension LargeImageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize.init(width: self.view.frame.width, height: self.view.frame.height)
    }
}

