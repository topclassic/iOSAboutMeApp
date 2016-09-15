//
//  MenuBar.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/14/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Support().getUIColor(1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let labelName = ["Objective","Enducation", "Experience", "Activity", "Technical Skill"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collection.registerClass(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collection)
        addConstraintsWithFormat("H:|[v0]|", views: collection)
        addConstraintsWithFormat("V:|[v0]|", views: collection)
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MenuBarCell
       // cell.backgroundColor = Support().getUIColor(1)
        cell.labelView.text = labelName[indexPath.item]
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake (frame.width / 4 , frame.height)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}