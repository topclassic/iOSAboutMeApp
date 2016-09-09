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
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewBackgroundView()
        
    // side bar menu
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    func setTableViewBackgroundView(){
        let height: CGFloat = UIScreen.mainScreen().bounds.height
        var backgroundImage : UIImage?
        switch height {
        case 667: //iPhone 6, 6s
            backgroundImage = UIImage(named: "backgroundcode")
            break
        case 736: //iPhone 6 Plus, 6s Plus
            backgroundImage = UIImage(named: "backgroundcode")
            break
        case 568: //5, 5s, SE
            backgroundImage = UIImage(named: "backgroundcode")
            break
        default: //iPhone 4, 4s
            backgroundImage = UIImage(named: "backgroundcode")
            break
        }
        tableview.backgroundView = UIImageView(image: backgroundImage)
    }
}