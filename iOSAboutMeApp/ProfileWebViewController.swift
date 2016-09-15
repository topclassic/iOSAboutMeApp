//
//  ProfileWebViewController.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/9/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import UIKit
import JavaScriptCore
import BWWalkthrough
class ProfileWebviewViewController: UIViewController, UIScrollViewDelegate, UIWebViewDelegate,BWWalkthroughViewControllerDelegate {
    
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
   // @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        navigationController?.navigationBar.translucent = false //Show Custom Bar
        super.viewDidLoad()
        
        setupMenuBar()
        // side bar menu
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        //        webview.frame.size = CGSize(width: util.screenWidth - 30, height: util.screenHeight - 100)
        webview.scrollView.delegate = self
        loadAddress()
    }
    
    func loadAddress(){
        let urlString : String = "http://webtopclassic.azurewebsites.net/index.html"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
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

  /*  func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
  */
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return nil
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
    //Slide in
    func handle(){
        
        let blackView = UIView()
        blackView.backgroundColor = UIColor.blackColor()
        view.addSubview(blackView)
      //  blackView.frame
        
    }
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}