//
//  College+CoreDataProperties.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/28/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension College {

    @NSManaged var info: NSData?
    @NSManaged var year: NSNumber?

}
