//
//  ProfileWebViewController.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/9/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation
import JavaScriptCore

class TechnicalWebviewViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate{
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    // @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let urlString : String = "http://webtopclassic.azurewebsites.net/skill.html"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
    }
    
    
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
}