//
//  Person.swift
//  NamesToFaces
//
//  Created by Heang Ly on 8/25/21.
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
