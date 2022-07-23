//
//  ViewController.swift
//  AESwiftDatabase
//
//  Created by arman on 11/4/15.
//  Copyright © 2015 arman. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table View Data Source/Delegates
    var tableViewData:[(String, [AEMechInformation])]?

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData == nil ? 0 : tableViewData![section].1.count
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Do some animation
    }

    override  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> AETableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AECell", forIndexPath: indexPath) as? AETableViewCell
        
        cell!.mech = tableViewData == nil ? nil : tableViewData![indexPath.section].1[indexPath.row]
        return cell!
    }

}