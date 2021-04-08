//
//  TDDExampleAppTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class TDDExampleAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        
        super.tearDown()
    }
    
    func testInitialViewControllerIsContactListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first
        
        XCTAssertTrue(rootViewController is ContactListViewController)
    }

}
