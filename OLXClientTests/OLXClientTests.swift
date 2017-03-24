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
    
    //MARK: Test Item Model and ViewModel
    func testItemViewModelWithiPhone7() {
        let iPhone7 = Item()
        iPhone7.configure(picture: "", title: "iPhone 7", price: 10000, currency: "$", details: "Cheap iPhone 7", latitude: -31.0, longitude: -64.2169, featured: true, displayLocation: "Cordoba", imageHeight: 1024, dateTime: Date(timeIntervalSince1970: 0 ), id: 100)
        let iPhone7ViewModel = ItemViewModel(item: iPhone7)
        let coordinate = ItemCoordinate(latitude: -31.0, longitude: -64.2169)
        
        XCTAssertEqual(iPhone7ViewModel.priceText, "$10000")
        XCTAssertEqual(iPhone7ViewModel.coordinate,  coordinate )
        XCTAssertEqual(iPhone7ViewModel.dateTimeText, "31/12/1970")
        XCTAssertEqual(iPhone7ViewModel.idValue, "100")
    }
    
    
}
