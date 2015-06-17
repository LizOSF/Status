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
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate {

    @IBOutlet weak var tableView: UITableView!
    var updates: [Update]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        var urlString = "https://rawgit.com/jamescmartinez/Status/master/updates.json"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        //guarantteing that that value will not be nil
        
        let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        
        
        // TODO: Sample data, remove when getting real data.
        
        updates = [Update]()
        
        //initialized updates
        
        var user = User()
        //the instance of the user is equal to the class User. pay attention to case!!!!
      //  user.username = "James"
      //  user.name = "James Martinez"
      //  user.bio = "Him"
      //  user.city = "San Francisco"
      //  user.link = "http://somewebsite.com"
        
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
            
            let user = update.user
                cell.handleLabel.text = user.username
                cell.nameLabel.text = user.name
            return cell
                
            }
            
            //checking to see if updates exist
        }
        
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 130
    }
   
   // MARK: - NSURLConnectionDataDelegate

func connection(connection: NSURLConnection, didReceiveData data: NSData) {
    //println(connection)
    //println(data)
    
    let jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSArray
    
    updates = [Update]()
    
    for var i = 0; i < jsonObject.count; i++ {
        let updateJSON = jsonObject[i] as! [String: AnyObject]
        //this is a key
        let text = updateJSON["text"] as! String
        let date = updateJSON["date"] as! Int
        let userJSON = updateJSON["user"] as! [String: AnyObject]
        let link = userJSON["link"] as! String
        let name = userJSON["name"] as! String
        let username = userJSON["username"] as! String
        let city = userJSON["city"] as! String
        let bio = userJSON["bio"] as! String
        
        let updateEntityDescription = NSEntityDescription()
        updateEntityDescription.name = "Update"
        var update = Update(entity: updateEntityDescription, insertIntoManagedObjectContext: nil)
        update.text = text
        // TODO: convert date integer to NSDAte
        
        let userEntityDecription = NSEntityDescription()
        userEntityDecription.name = "User"
        var user = User(entity: userEntityDecription, insertIntoManagedObjectContext: nil)
        user.name = name
        user.username = city
        user.bio = bio
        user.link = link
        
        update.user = user
        
        updates?.append(update)
         
        println(jsonObject)
    }
    tableView.reloadData()
    
    
 }

}


