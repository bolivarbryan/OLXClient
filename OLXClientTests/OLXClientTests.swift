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
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: Unit Tests
    func testItemViewModelWithiPhone7() {
        let iPhone7 = Item(picture: "", title: "iPhone 7", price: 10000, currency: "$", details: "Vendo iPhone 7 a precio de huevo", latitude: -31.0, longitude: -64.2169, featured: true, displayLocation: "Cordoba", imageHeight: 1024, dateTime: Date(timeIntervalSince1970: 0 ))
        let iPhone7ViewModel = ItemViewModel(item: iPhone7)
        let coordinate = ItemCoordinate(latitude: -31.0, longitude: -64.2169)
        
        XCTAssertEqual(iPhone7ViewModel.priceText, "$10000")
        XCTAssertEqual(iPhone7ViewModel.coordinate,  coordinate )
        XCTAssertEqual(iPhone7ViewModel.dateTimeText, "31/12/1970")
    }
}
