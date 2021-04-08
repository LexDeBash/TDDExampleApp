//
//  NewContactViewControllerTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 21/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class NewContactViewControllerTests: XCTestCase {

    var newContactVC: NewContactViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        newContactVC = storyboard.instantiateViewController(
            withIdentifier: "NewContactViewController"
            ) as? NewContactViewController
        newContactVC.loadViewIfNeeded()
    }

    override func tearDown() {
        newContactVC = nil
        super.tearDown()
    }
    
    func testHasNameLable() {
        XCTAssertNotNil(newContactVC.nameTextField)
        XCTAssertTrue(newContactVC.nameTextField.isDescendant(of: newContactVC.view))
    }
    
    func testHasPhoneLable() {
        XCTAssertNotNil(newContactVC.phoneTextField)
        XCTAssertTrue(newContactVC.phoneTextField.isDescendant(of: newContactVC.view))
    }
    
    func testHasSurnameLable() {
        XCTAssertNotNil(newContactVC.surnameTextField)
        XCTAssertTrue(newContactVC.surnameTextField.isDescendant(of: newContactVC.view))
    }
    
    func testHasSaveButton() {
        XCTAssertNotNil(newContactVC.saveButton)
        XCTAssertTrue(newContactVC.saveButton.isDescendant(of: newContactVC.view))
    }
    
    func testHasCancelButton() {
        XCTAssertNotNil(newContactVC.cancelButton)
        XCTAssertTrue(newContactVC.cancelButton.isDescendant(of: newContactVC.view))
    }
    
    func testSaveNewContact() {
        newContactVC.nameTextField.text = "Foo"
        newContactVC.surnameTextField.text = "Bar"
        newContactVC.phoneTextField.text = "Baz"
        
        newContactVC.contactManager = ContactManager()
        newContactVC.saveButtonPressed()
        
        let contact = newContactVC.contactManager.contactList[0]
        let imageData = #imageLiteral(resourceName: "testImage").pngData()
        let newContact = Person(
            name: "Foo",
            surname: "Bar",
            phone: "Baz",
            image: imageData
        )
        
        XCTAssertEqual(contact, newContact)
    }
    
    func testSaveButtonHasSaveMethod() {
        let saveButton = newContactVC.saveButton
        guard let action = saveButton?.actions(
            forTarget: newContactVC,
            forControlEvent: .touchUpInside
            ) else { XCTFail(); return }
        
        XCTAssertTrue(action.contains("saveButtonPressed"))
    }
    
    func testSaveDismissesNewContactViewController() {
        let mockNewContactVC = MockNewContactViewController()
        mockNewContactVC.nameTextField = UITextField()
        mockNewContactVC.nameTextField.text = "Foo"
        mockNewContactVC.surnameTextField = UITextField()
        mockNewContactVC.surnameTextField.text = "Bar"
        mockNewContactVC.phoneTextField = UITextField()
        mockNewContactVC.phoneTextField.text = "Baz"
        
        mockNewContactVC.contactManager = ContactManager()
        mockNewContactVC.saveButtonPressed()
        
        XCTAssertTrue(mockNewContactVC.isDismissed)
    }
}

extension NewContactViewControllerTests {
    class MockNewContactViewController: NewContactViewController {
        var isDismissed = false
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
        }
    }
}
