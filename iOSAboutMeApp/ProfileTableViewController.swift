//
//  ProfileTableViewController.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/8/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation
import BWWalkthrough

class ProfileTableViewController: UITableViewController, BWWalkthroughViewControllerDelegate {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   setTableViewBackgroundView()
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
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if !userDefaults.boolForKey("walkthroughPresented") {
            
            showWalkthrough()
            
            userDefaults.setBool(true, forKey: "walkthroughPresented")
            userDefaults.synchronize()
        }
    }
    
    @IBAction func showWalkthrough(){

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
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func walkthroughPageDidChange(pageNumber: Int) {
        print("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
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