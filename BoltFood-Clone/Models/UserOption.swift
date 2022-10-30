//
//  UserOption.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 30/08/2022.
//

import Foundation


struct UserOption {
    var title: String
    var icon: String
    
    
    static let optionList: [UserOption] = [
        UserOption(title: "Payment", icon: "creditcard"),
        UserOption(title: "Promo codes", icon: "tag"),
        UserOption(title: "Profile", icon: "person"),
        UserOption(title: "Settings", icon: "gearshape"),
        UserOption(title: "About", icon: "info.circle"),
        UserOption(title: "Help", icon: "questionmark.circle"),
    ]
}
