//
//  Item.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation
import RealmSwift
final class Item: Object {
    dynamic var picture: String = ""
    dynamic var title: String = ""
    dynamic var price: Double = 0
    dynamic var currency: String = "$"
    dynamic var details: String = ""
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
    dynamic var featured: Bool = false
    dynamic var displayLocation: String = ""
    dynamic var imageHeight: Int = 0
    dynamic var dateTime: Date = Date()
    dynamic var id: Int = 0
    
    func configure(picture: String, title: String, price: Double, currency: String, details:String, latitude: Double, longitude: Double, featured: Bool, displayLocation: String, imageHeight: Int, dateTime: Date, id: Int) {
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
        self.id = id
    }
    

}


func == (lhs: Item, rhs: Item) -> Bool{
    return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
}
