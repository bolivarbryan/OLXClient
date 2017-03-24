//
//  DateExtensions.swift
//  OLXClient
//
//  Created by Bryan on 24/03/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

struct OLXDateFormatter {
    
    static func formatString(string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.date(from: string)
    }
    
}
