//
//  ItemViewModel.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

typealias ItemCoordinate = (latitude: Double, longitude: Double)

final class ItemViewModel{
    private var item: Item?
    var titleText: String?
    var priceText: String?
    var detailsText: String?
    var coordinate: ItemCoordinate?
    var featured: Bool?
    var displayLocationText: String?
    var imageHeight: Int?
    var dateTimeText: String?
    
    init(item: Item) {
        self.item = item
    }
}
