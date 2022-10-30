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
    
    
    static let addressData: [DeliveryAddress] = [
    
        DeliveryAddress(location: "Current location", area: "Adamafio Link", icon: "navigate"),
        DeliveryAddress(location: "Home", area: "Ayawaso", icon: "home-outline"),
        DeliveryAddress(location: "Work", area: "West Airport, Accra", icon: "work"),
        DeliveryAddress(location: "Accra", area: nil, icon: "map-pin"),
        DeliveryAddress(location: "North Airport Road", area: nil, icon: "map-pin"),
        DeliveryAddress(location: "Accra", area: "Ghana", icon: "map-pin"),
        DeliveryAddress(location: "Department", area: "Accra", icon: "map-pin"),
        DeliveryAddress(location: "Law School", area: "University of Ghana", icon: "map-pin"),
        DeliveryAddress(location: "North Legon", area: "Accra, Ghana", icon: "map-pin"),
    ]
}
