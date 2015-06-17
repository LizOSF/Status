//
//  User.swift
//  Status
//
//  Created by Elisabeth O'Donnell on 6/15/15.
//  Copyright (c) 2015 Elisabeth O'Donnell. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var bio: String
    @NSManaged var username: String
    @NSManaged var link: String
    @NSManaged var city: String
    @NSManaged var updates: NSSet

}
