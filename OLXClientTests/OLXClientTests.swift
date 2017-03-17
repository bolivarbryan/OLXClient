//
//  OLXClientTests.swift
//  OLXClientTests
//
//  Created by Bryan A Bolivar M on 3/14/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import XCTest
@testable import OLXClient

class OLXClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItemViewModelWithiPhone7() {
        let iPhone7 = Item(picture: "", title: "iPhone 7", price: 10000, currency: "$", details: "Vendo iPhone 7 a precio de huevo", latitude: -31.0, longitude: -64.2169, featured: true, displayLocation: "Cordoba", imageHeight: 1024, dateTime: Date())
        let iPhone7ViewModel = ItemViewModel(item: iPhone7)
        XCTAssertEqual(iPhone7ViewModel.priceText, "$10000")
    }
}
