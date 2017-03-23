//
//  OLXNumberFormatter.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

final class OLXNumberFormatter {
    
    //MARK: Initializer
    private init() {
        numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 1
    }
    
    //MARK: Shared Instance
    static let sharedInstance: OLXNumberFormatter = OLXNumberFormatter()
    
    //MARK: Local Variable
    var numberFormatter = NumberFormatter()

    //MARK: Functions
    func removeZeroDecimals(fromDouble number: Double) -> String? {
        let numberObject = NSNumber(value: number)
        let value = numberFormatter.string(from: numberObject)
        return value
    }
    
}
