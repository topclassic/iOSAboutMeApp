//
//  MyAppTableViewController.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/8/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation
import BWWalkthrough

class MyAppTableViewController: UITableViewController, BWWalkthroughViewControllerDelegate {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // side bar menu
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
}