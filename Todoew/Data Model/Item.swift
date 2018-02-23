//
//  Item.swift
//  Todoew
//
//  Created by Mac User on 2/22/18.
//  Copyright © 2018 ZeppoWare. All rights reserved.
//

import Foundation
import RealmSwift


class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
