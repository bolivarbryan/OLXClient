//
//  ItemCoordinate.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

struct ItemCoordinate: Equatable{
    var latitude: Double
    var longitude: Double
}

func == (lhs: ItemCoordinate, rhs: ItemCoordinate) -> Bool {
    return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
}
