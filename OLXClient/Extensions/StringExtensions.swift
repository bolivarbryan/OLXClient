//
//  StringExtensions.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/17/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation

extension String {
    //MARK: Methods
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
