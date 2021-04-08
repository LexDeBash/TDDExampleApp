//
//  MenuDataSourceTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 16/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class MenuDataSourceTests: XCTestCase {
    
    func testHasOneSection() {
        let dataSource = MenuDataSource(pizzas: [.fixture()])
        XCTAssertEqual(dataSource.numberOfSections, 1)
    }
    
    func testRowsInSection() {
        let dataSource = MenuDataSource(pizzas: [.fixture(), .fixture(), .fixture()])
        XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
    }
    
    func testRowsInOutOfBoundsSectionIsZero() {
        let dataSource = MenuDataSource(pizzas: [.fixture(), .fixture(), .fixture()])
        XCTAssertEqual(dataSource.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(dataSource.numberOfRows(inSection: -1), 0)
    }
    
    func testItemForRowAndSection() {
        let dataSource = MenuDataSource(
            pizzas: [.fixture(name: "Margherita"), .fixture(name: "Capricciosa")]
        )
        XCTAssertEqual(dataSource.item(forRow: 0, inSection: 0)?.title, "Margherita")
        XCTAssertEqual(dataSource.item(forRow: 1, inSection: 0)?.title, "Capricciosa")
    }
    
    func testItemForOutOfBoundsRowAndSectionIsNil() {
        let dataSource = MenuDataSource(
            pizzas: [.fixture(name: "Margherita"), .fixture(name: "Capricciosa")]
        )
        XCTAssertNil(dataSource.item(forRow: 2, inSection: 0))
        XCTAssertNil(dataSource.item(forRow: 0, inSection: 1))
        XCTAssertNil(dataSource.item(forRow: 2, inSection: 1))
        XCTAssertNil(dataSource.item(forRow: -1, inSection: -1))
    }
}
