//
//  Item.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

final class Item: Equatable {
    var picture: String
    var title: String
    var price: Double
    var currency: String
    var details: String
    var latitude: Double
    var longitude: Double
    var featured: Bool
    var displayLocation: String
    var imageHeight: Int
    var dateTime: Date
    
    init(picture: String, title: String, price: Double, currency: String, details:String, latitude: Double, longitude: Double, featured: Bool, displayLocation: String, imageHeight: Int, dateTime: Date) {
        self.picture = picture
        self.title = title
        self.price = price
        self.currency = currency
        self.details = details
        self.latitude = latitude
        self.longitude = longitude
        self.featured = featured
        self.displayLocation = displayLocation
        self.imageHeight = imageHeight
        self.dateTime = dateTime
    }
}


func == (lhs: Item, rhs: Item) -> Bool{
    return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
}
