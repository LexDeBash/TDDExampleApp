//
//  TDDExampleAppUITests.swift
//  TDDExampleAppUITests
//
//  Created by Alexey Efimov on 23/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest

class TDDExampleAppUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
                
        XCTAssertTrue(app.isMainView)
        
        app.navigationBars["TDDExampleApp.ContactListView"].buttons["Add"].tap()
        
        app.textFields["Name"].tap()
        app.textFields["Name"].typeText("Foo")
        
        app.textFields["Surname"].tap()
        app.textFields["Surname"].typeText("Bar")
        
        app.textFields["Phone"].tap()
        app.textFields["Phone"].typeText("Baz")
        
        XCTAssertFalse(app.isMainView)
        
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Foo"].exists)
                        
    }
}

extension XCUIApplication {
    var isMainView: Bool {
        return otherElements["mainView"].exists
    }
}
