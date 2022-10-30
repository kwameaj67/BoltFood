//
//  DeliveryAddress.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 08/09/2022.
//

import Foundation

struct DeliveryAddress {
    var location: String
    var area: String?
    var icon: String
    var selected: Bool
    
    
    static let addressData: [DeliveryAddress] = [
    
        DeliveryAddress(location: "Current location", area: "Adamafio Link", icon: "navigate",selected: false),
        DeliveryAddress(location: "Home", area: "Ayawaso", icon: "home-outline",selected: false),
        DeliveryAddress(location: "Work", area: "West Airport, Accra", icon: "work", selected: false),
        DeliveryAddress(location: "Accra", area: nil, icon: "map-pin", selected: false),
        DeliveryAddress(location: "North Airport Road", area: nil, icon: "map-pin", selected: false),
        DeliveryAddress(location: "Accra", area: "Ghana", icon: "map-pin", selected: false),
        DeliveryAddress(location: "Department", area: "Accra", icon: "map-pin", selected: false),
        DeliveryAddress(location: "Law School", area: "University of Ghana", icon: "map-pin", selected: false),
        DeliveryAddress(location: "North Legon", area: "Accra, Ghana", icon: "map-pin", selected: false),
    ]
}
