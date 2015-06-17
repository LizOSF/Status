//
//  Update.swift
//  Status
//
//  Created by Elisabeth O'Donnell on 6/15/15.
//  Copyright (c) 2015 Elisabeth O'Donnell. All rights reserved.
//

import Foundation
import CoreData

class Update: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var date: NSDate
    @NSManaged var user: NSManagedObject

}
