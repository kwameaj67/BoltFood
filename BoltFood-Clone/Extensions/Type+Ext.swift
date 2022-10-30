//
//  String+Ext.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 15/09/2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

extension Double {
    func twoDecimalPlaces() -> String {
        return String(format: "%.2f", self)
    }
}
