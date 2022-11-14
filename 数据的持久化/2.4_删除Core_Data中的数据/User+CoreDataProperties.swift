//
//  User+CoreDataProperties.swift
//  删除Core_Data中的数据
//
//  Created by 廖家龙 on 2021/7/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var userName: String?

}

extension User : Identifiable {

}
