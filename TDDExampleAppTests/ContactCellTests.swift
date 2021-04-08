//
//  ContactCellTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 19/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class ContactCellTests: XCTestCase {
    
    var cell: ContactCell!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController"
            ) as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "cell",
            for: IndexPath(row: 0, section: 0)
            ) as? ContactCell
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func testCellHasTitleLabel() {
        
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testCellHasTitleLabelInContentView() {
        
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsName() {
        let person = Person(name: "Foo", phone: "Bar")
        cell.configureCell(with: person)
        XCTAssertEqual(cell.nameLabel.text, person.name)
    }
}

extension ContactCellTests {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
