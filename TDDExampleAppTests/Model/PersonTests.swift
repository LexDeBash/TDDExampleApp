//
//  PersonTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class PersonTests: XCTestCase {
    
    var image: UIImage?
    var imageData: Data?
    
    override func setUp() {
        super.setUp()
        image = #imageLiteral(resourceName: "avatar")
        imageData = image?.pngData()
    }
    
    override func tearDown() {
        image = nil
        imageData = nil
        
        super.tearDown()
    }

    func testInitPersonWithNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar") // Foo, Bar, Baz
        
        XCTAssertNotNil(person)
    }
    
    func testInitPersonWithFullNameAndPhone() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertNotNil(person)
    }
    
    func testInitPersonWithDate() {
        let person = Person(name: "Foo", phone: "Bar")
        
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithFullNameAndDate() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
        let person = Person(name: "Foo", phone: "Bar", image: imageData)
        
        XCTAssertNotNil(person.image)
    }
    
    func testInitPersonWithFullNameAndImage() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", image: imageData)
        
        XCTAssertNotNil(person.image)
    }
    
    func testWhenGivetNameAndPhoneSetsNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        
        XCTAssertEqual(person.name, "Foo")
        XCTAssertEqual(person.phone, "Bar")
    }
    
    func testWhenGivenSurnameSetsSurname() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertTrue(person.surname == "Bar")
    }
}
