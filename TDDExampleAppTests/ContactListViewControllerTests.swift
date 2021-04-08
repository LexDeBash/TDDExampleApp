//
//  ContactListViewControllerTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 17/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class ContactListViewControllerTests: XCTestCase {

    var sut: ContactListViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController"
            ) as? ContactListViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedContactListDataSourceIsNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is ContactListDataSource)
    }
    
    func testHasAddNewContactButton() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? ContactListViewController, sut)
    }
    
    func testOpenNewContactViewController() {
        let newContactVC = presentingNewContactViewController()
        XCTAssertNotNil(newContactVC.nameTextField)
    }
    
    func testSharesSameContactManagerWithNewContactVC() {
        let newContactVC = presentingNewContactViewController()
        XCTAssertTrue(
            newContactVC.contactManager === sut.dataSource.contactManager
        )
    }
    
    func presentingNewContactViewController() -> NewContactViewController {
        guard
            let addNewContactButton = sut.navigationItem.rightBarButtonItem,
            let action = addNewContactButton.action
            else {
                return NewContactViewController()
        }
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.performSelector(onMainThread: action,
                            with: addNewContactButton,
                            waitUntilDone: true)
        
        let newContactVC = sut.presentedViewController as! NewContactViewController
        
        return newContactVC
    }
    
    func testWhenViewAppearedTableViewReloaded() {
        let mockTableView = MockTableView()
        sut.tableView = mockTableView
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertTrue((sut.tableView as! MockTableView).isReloaded)
    }
    
    func testTappingCellSendsNotification() {
        let image = #imageLiteral(resourceName: "testImage").pngData()
        let person = Person(name: "Foo", phone: "Bar", image: image)
        sut.dataSource.contactManager?.add(person: person)
        
        expectation(forNotification: NSNotification.Name("DidSelectRow notification"), object: nil) { (notification) -> Bool in
            guard let personFromNotification = notification.userInfo?["person"] as? Person else { return false }
            
            return person == personFromNotification
        }
        
        let tableView = sut.tableView
        tableView?.delegate?.tableView!(tableView!, didSelectRowAt: IndexPath(row: 0, section: 0))
        waitForExpectations(timeout: 1)
    }
    
    func testSelectedCellHasShownDetailViewController() {
        
        let mockNavigationController = MockNavigationController(
            rootViewController: sut
        )
        UIApplication.shared.keyWindow?.rootViewController = mockNavigationController
        
        sut.loadViewIfNeeded()
        
        let image = #imageLiteral(resourceName: "testImage").pngData()
        let personOne = Person(name: "Foo", phone: "Bar", image: image)
        let personTwo = Person(name: "Bar", phone: "Baz", image: image)
        sut.dataSource.contactManager?.add(person: personOne)
        sut.dataSource.contactManager?.add(person: personTwo)
        
        NotificationCenter.default.post(
            name: NSNotification.Name(
                rawValue: "DidSelectRow notification"
            ), object: self, userInfo: ["person": personTwo]
        )
        
        guard let detailVC = mockNavigationController
            .pushedViewController as? DetailViewController
            else {
                XCTFail()
                return
        }
        
        detailVC.loadViewIfNeeded()
        
        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.person == personTwo)
    }
    
    /*
    func testSegues() {
        let identifiers = segues(ofViewController: sut)
        XCTAssertEqual(identifiers.count, 1)
        XCTAssertTrue(identifiers.contains("showDetail"))
    }
    
    func segues(ofViewController viewController: UIViewController) -> [String] {
        let identifiers = (viewController.value(forKey: "storyboardSegueTemplates") as? [AnyObject])?.compactMap({ $0.value(forKey: "identifier") as? String }) ?? []
        return identifiers
    }
    */

}

// MARK: - MockTableView
extension ContactListViewControllerTests {
    class MockTableView: UITableView {
        var isReloaded = false
        override func reloadData() {
            isReloaded = true
        }
    }
}

extension ContactListViewControllerTests {
    class MockNavigationController: UINavigationController {
        var pushedViewController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}

extension ContactListViewControllerTests {
    class MockContactListViewController: ContactListViewController {
//        var isPrepared = false
        var segueIdentifier: String?
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            isPrepared = true
            segueIdentifier = segue.identifier
        }
    }
}
