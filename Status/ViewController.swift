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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var updates: [Update]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // TODO: Sample data, remove when getting real data.
        
        updates = [Update]()
        
        //initialized updates
        
        var user = User()
        //the instance of the user is equal to the class User. pay attention to case!!!!
        user.username = "James"
        user.name = "James Martinez"
        user.bio = "Him"
        user.city = "San Francisco"
        user.link = "http://somewebsite.com"
        
        for var i = 0; i < 100; i++ {
        
        var update = Update()
        update.date = NSDate()
        update.text = "Hello, World \(i)"
        update.user = user
        
        updates?.append(update)
        
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let updatesCount = updates?.count {
            return updatesCount
        // will get error if this alone, b/c not sure if updates.count exists
        }
        return 0
    }
    
 //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // TODO: Make this cell reuseable
        
        var cell =
        NSBundle.mainBundle().loadNibNamed("UpdateTableViewCell", owner: self, options: nil).first as! UpdateTableViewCell
        
        //var cell = UITableViewCell()
        if let updates = updates {
            //this green updates is the udpated at the top of the file, instance in the view controller. white updates is the small scope.
            var update = updates[indexPath.row]
            cell.textLabel?.text = update.text
            
            if let user = update.user {
                cell.handleLabel.text = user.username
                cell.nameLabel.text = user.name
                
            }
            
            //checking to see if updates exist
        }

        return cell
        
    }
    
   

}

