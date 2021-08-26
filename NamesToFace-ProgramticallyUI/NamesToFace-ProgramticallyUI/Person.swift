//
//  Person.swift
//  NamesToFace-ProgramticallyUI
//
//  Created by Heang Ly on 8/26/21.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

