//
//  ViewController.swift
//  Status
//
//  Created by Elisabeth O'Donnell on 6/8/15.
//  Copyright (c) 2015 Elisabeth O'Donnell. All rights reserved.
//

// MVC
// M  Data. classes that aren't any subclasses. like a user, or status. The model is the backbone of your app. Every app has a model layer. Typically, start with user model. A user model is a code representaiton of a user.
// V
// C . View controller.

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Return count of update items
        return 0
    }
    
 //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // TODO: Make this cell reuseable
        var cell = UITableViewCell()
        return cell
        
    }
    
   

}

