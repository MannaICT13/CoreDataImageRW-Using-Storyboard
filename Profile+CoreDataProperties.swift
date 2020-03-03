//
//  Profile+CoreDataProperties.swift
//  CoreDataImageRW Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 3/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var name: String?
    @NSManaged public var img: Data?

}
