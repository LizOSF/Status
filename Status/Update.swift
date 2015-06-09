//
//  Update.swift
//  Status
//
//  Created by Elisabeth O'Donnell on 6/8/15.
//  Copyright (c) 2015 Elisabeth O'Donnell. All rights reserved.


//has many relationship. a user owns an update. you'd write "update.user." because each update has only one single user. [typically you don't do this, but you could represent it as an array of update.]

import Foundation

class Update {
    var user: User?
    var text: String?
    var date: NSDate?
}
