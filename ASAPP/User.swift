//
//  User.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/26/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import Foundation
import CoreData

// @func(Person) edit: removed
class User: NSManagedObject {
    
    @NSManaged var username: String?
    @NSManaged var password: String?
}
