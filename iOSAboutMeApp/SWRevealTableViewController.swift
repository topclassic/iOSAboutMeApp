//
//  SWRevealTableViewController.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/8/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation

class SWRevealTableViewController: UITableViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = Support().getUIColor(0)  // change color tableview
        
    }
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor() // clear color cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = Support().getUIColor(1)
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 5{
            selectedCell.contentView.backgroundColor = Support().getUIColor(0)
        }
    }
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = Support().getUIColor(1)
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 5{
            selectedCell.contentView.backgroundColor = Support().getUIColor(0)
        }
    }
    

}