//
//  DetailViewControllerTests.swift
//  TDDExampleAppTests
//
//  Created by Alexey Efimov on 19/07/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import XCTest
@testable import TDDExampleApp

class DetailViewControllerTests: XCTestCase {
    
    var detailVC: DetailViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
            ) as? DetailViewController
        detailVC.loadViewIfNeeded()
    }

    override func tearDown() {
        detailVC = nil
        super.tearDown()
    }
    
    func testHasNameLable() {
        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.nameLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasPhoneLable() {
        XCTAssertNotNil(detailVC.phoneLabel)
        XCTAssertTrue(detailVC.phoneLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasSurnameLable() {
        XCTAssertNotNil(detailVC.surnameLabel)
        XCTAssertTrue(detailVC.surnameLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasImageView() {
        XCTAssertNotNil(detailVC.imageView)
        XCTAssertTrue(detailVC.imageView.isDescendant(of: detailVC.view))
    }
    
    func testSetValueToNameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.nameLabel.text, "Foo")
    }
    
    func testSetValueToSurnameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.surnameLabel.text, "Bar")
    }
    
    func testSetValueToPhoneLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.phoneLabel.text, "Baz")
    }
    
    func testSetValueToImageView() {
        setupContactAndAppearanceTrancition()
        let imageData = #imageLiteral(resourceName: "testImage").pngData()
        XCTAssert(detailVC.person.image == imageData)
    }
    
    func testImageViewNotNil() {
        setupContactAndAppearanceTrancition()
        XCTAssertNotNil(detailVC.imageView.image)
    }
    
    func setupContactAndAppearanceTrancition() {
        let image = #imageLiteral(resourceName: "testImage")
        let imageData = image.pngData()
        let person = Person(name: "Foo",
                        surname: "Bar",
                        phone: "Baz",
                        image: imageData)
        
        detailVC.person = person
        
        detailVC.beginAppearanceTransition(true, animated: true)
        detailVC.endAppearanceTransition()
    }
}
