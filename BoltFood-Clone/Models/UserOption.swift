//
//  UserOption.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 30/08/2022.
//

import Foundation

enum UserOptionType{
    case payment
    case promocode
    case profile
    case settings
    case about
    case help
}
struct UserOption {
    var title: String
    var icon: String
    var type: UserOptionType
    
    
    static let optionList: [UserOption] = [
        UserOption(title: "Payment", icon: "creditcard",type: .payment),
        UserOption(title: "Promo codes", icon: "tag", type: .promocode),
        UserOption(title: "Profile", icon: "person", type: .profile),
        UserOption(title: "Settings", icon: "gearshape",type: .settings),
        UserOption(title: "About", icon: "info.circle",type: .about),
        UserOption(title: "Help", icon: "questionmark.circle",type: .help),
    ]
}
