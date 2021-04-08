//
//  ContactManager.swift
//  TDDExampleApp
//
//  Created by Alexey Efimov on 17/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class ContactManager {
    var contactList: [Person] = []
    
    func add(person: Person) {
        if !contactList.contains(person) {
            contactList.append(person)
        }
    }
}
