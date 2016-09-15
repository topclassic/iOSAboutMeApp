//
//  BaseCell.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/15/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//
import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
        func setupViews(){
            
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Setup cell in MenuBar
class  MenuBarCell: BaseCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "aboutme")
        return iv
    }()
    let labelView: UILabel = {
        let lv = UILabel()
        return lv
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(labelView)
        addConstraintsWithFormat("H:[v0(28)]", views: labelView)
        addConstraintsWithFormat("V:[v0(28)]", views: labelView)
        
        // Set Center
        addConstraint(NSLayoutConstraint(item: labelView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: labelView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
}