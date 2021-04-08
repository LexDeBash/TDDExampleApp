//
//  Person.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var phone: String
    var surname: String?
    var image: Data?
    private(set) var date: Date?
    
    init(name: String, phone: String, image: Data? = nil) {
        self.name = name
        self.phone = phone
        self.image = image
        date = Date()
    }
    
    init(name: String, surname: String, phone: String, image: Data? = nil) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.image = image
        date = Date()
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.phone == rhs.phone
    }
}
