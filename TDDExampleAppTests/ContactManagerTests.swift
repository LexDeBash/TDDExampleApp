//
//  ContactManagerTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 17/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class ContactManagerTests: XCTestCase {
    
    var contactManager: ContactManager!
    var person: Person!

    override func setUp() {
        super .setUp()
        contactManager = ContactManager()
        person = Person(name: "Foo", phone: "Bar")
    }

    override func tearDown() {
       contactManager = nil
        person = nil
        super.tearDown()
    }
    
    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactList.count, 0)
    }
    
    func testAddPersonIncrementContactListCount() {
        contactManager.add(person: person)
        
        XCTAssertEqual(contactManager.contactList.count, 1)
    }
    
    func testContactAtIndexIsAddedPerson() {
        contactManager.add(person: person)
        
        let returnedPerson = contactManager.contactList[0]
        
        XCTAssertEqual(person, returnedPerson)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        
        XCTAssertEqual(contactManager.contactList.count, 1)
    }
}
