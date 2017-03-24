//
//  Item.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

final class Item: Object, Mappable {
    
    //MARK: Properties
    
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
    dynamic var dateTime: Date = Date(timeIntervalSince1970: 1)
    dynamic var id: Int = 0
    
    //MARK: Primary key
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Implementation of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id    <- map["id"]
        picture <- map["picture"]
        title <- map["title"]
        price <- map["price"]
        picture <- map["picture"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        details <- map["details"]
        dateTime <- map["dateTime"]
        displayLocation <- map["displayLocation"]
    }
  
}
//MARK: Equatable
func == (lhs: Item, rhs: Item) -> Bool{
    return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
}

extension Item {
    
    //MARK: Functions
    
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
    
    class func saveInstanceToDatabase(dataObject: Dictionary<String, Any>) {
        do {
            //getting price
            guard let price = dataObject["price"] as? Dictionary<String, Any> else {
                return
            }
            let priceAmmount = price["amount"] as! Double
            
            var dictionary =  dataObject
            //getting coordinate
            let latitude = (dictionary["coordinates"] as! Dictionary<String, Any>)["latitude"] as! Double
            let longitude = (dictionary["coordinates"] as! Dictionary<String, Any>)["longitude"] as! Double
            dictionary["price"] = priceAmmount
            dictionary["latitude"] = latitude
            dictionary["longitude"] = longitude
            dictionary["picture"] = dictionary["fullImage"] as! String
            dictionary["details"] = dictionary["description"] as! String
            dictionary["dateTime"] = (dictionary["date"] as! Dictionary<String, Any>)["timestamp"]! as! String
            dictionary["displayLocation"] = dictionary["displayLocation"] as! String

            
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            
            //realm instance, may trows.
            let realm = try! Realm()
            
            //FIXME: add respective validations for error handling
            try! realm.write {
                var json = dictionary
                json["dateTime"] = OLXDateFormatter.formatString(string: json["dateTime"] as! String)
                
                realm.create(Item.self, value: json, update: true)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    class func listAllItems() -> Results<Item> {
        let realm = try! Realm()
        let items = realm.objects(Item.self)
        return items
    }
    
    class func clear() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
