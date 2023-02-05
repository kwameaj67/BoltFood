//
//  Payment.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/10/2022.
//

import Foundation

struct SectionOption{
    var name: String
    var icon: String
    var selected: Bool
}

struct Section {
    var sectionName: String
    var sectionItems: [SectionOption]
    
    static var balanceQuestionData:[SectionOption] = [
        SectionOption(name: "What is Bolt balance?", icon: "help",selected: false),
        SectionOption(name: "See transactions", icon: "clock",selected: false)
    ]

    static var paymentMethodData:[SectionOption] = [
        SectionOption(name: "Mobile money", icon: "phone",selected: false),
        SectionOption(name: "Cash", icon: "money",selected: false),
        SectionOption(name: "Add debit/credit card", icon: "plus",selected: false)
    ]
    
    static var sectionArray = [
        Section(sectionName: "", sectionItems: balanceQuestionData),
        Section(sectionName: "Payment methods", sectionItems: paymentMethodData),
    ]

}
