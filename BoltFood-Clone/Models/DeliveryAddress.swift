//
//  DeliveryAddress.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 08/09/2022.
//

import Foundation

class DeliveryAddress {
    var location: String
    var area: String?
    var icon: String
    var selected: Bool
    
    init(location: String, area: String?, icon: String, selected: Bool){
        self.location = location
        self.area = area
        self.icon = icon
        self.selected = selected
    }
}
