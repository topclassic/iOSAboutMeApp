//
//  ProfileTableViewController.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/8/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation
import BWWalkthrough

class HelpViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)// fix layout balance with tabbar
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)// fix scroll balance with tabbar
        
        setupMenuBar()
        /*
         // Get view controllers and build the walkthrough
         let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
         let walkthrough = stb.instantiateViewControllerWithIdentifier("walk") as! BWWalkthroughViewController
         let page_one = stb.instantiateViewControllerWithIdentifier("walk1")
         let page_two = stb.instantiateViewControllerWithIdentifier("walk2")
         let page_three = stb.instantiateViewControllerWithIdentifier("walk3")
         
         // Attach the pages to the master
         walkthrough.delegate = self
         walkthrough.addViewController(page_one)
         walkthrough.addViewController(page_two)
         walkthrough.addViewController(page_three)
         
         self.presentViewController(walkthrough, animated: true, completion: nil)
         */
        // side bar menu
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    // Set MenuBar
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar) // Set Height
    }
    // End Set MenuBar
    
    
}