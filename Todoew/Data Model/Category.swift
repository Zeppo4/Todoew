//
//  Category.swift
//  Todoew
//
//  Created by Mac User on 2/22/18.
//  Copyright © 2018 ZeppoWare. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
