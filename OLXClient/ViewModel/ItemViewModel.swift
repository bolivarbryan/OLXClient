//
//  ItemViewModel.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

final class ItemViewModel: Equatable {
    //MARK: Properties
    private var item: Item
    var titleText: String? {
        return item.title
    }
    
    var priceText: String? {
        guard let value = OLXNumberFormatter.sharedInstance.removeZeroDecimals(fromDouble: item.price) else {
            return nil
        }
        return "\(item.currency)\(value)"
    }
    
    var detailsText: String {
        return item.details
    }
    
    var coordinate: ItemCoordinate {
        return ItemCoordinate(latitude: item.latitude, longitude: item.longitude)
    }
    
    var featured: Bool {
        return item.featured
    }
    
    var displayLocationText: String {
        return item.displayLocation
    }
    var imageHeight: Int {
        return item.imageHeight
    }
    
    var dateTimeText: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/YYYY"
        return dateFormat.string(from: item.dateTime)
    }
    
    init(item: Item) {
        self.item = item
    }
}

func == (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool {
    return (lhs.coordinate.latitude == rhs.coordinate.latitude) && (lhs.coordinate.latitude == rhs.coordinate.longitude)
}

