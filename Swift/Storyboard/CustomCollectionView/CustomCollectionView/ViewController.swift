//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by 노연주 on 2021/07/19.
//

import UIKit

class ViewController: UICollectionViewController {
    var collectionItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setCollectionItem()
    }

    func setCollectionItem(){ NSLog("setCollectionItem")
        collectionItems = [
            "One",
            "Two",
            "Three",
            "Four",
            "Five",
            "Six",
            "Seven",
            "Eight",
            "Nine",
            "Ten"
        ]
    }
    
    // MARK: - CollectionView DataSource

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        cell.collectionViewLabel.text = collectionItems[indexPath.row]
        return cell
    }
}

