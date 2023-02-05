//
//  Order.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/08/2022.
//

import Foundation


struct OrderHistory {
    var image: String
    var title: String
    var price: Double
    var date: String
    
    static let orderHistory : [OrderHistory] = [
        OrderHistory(image: "chicken", title: "Pizzaman Chickenman - East Legon", price: 71.40, date: "29 Aug, 2022 8:03 PM"),
        OrderHistory(image: "chicken", title: "Pizzaman Chickenman - Kissieman", price: 77.00, date: "24 Aug, 2022 8:47 PM"),
        OrderHistory(image: "pizza", title: "Papa's Pizza East Legon", price: 78.00, date: "11 Aug, 2022 8:48 PM"),
        OrderHistory(image: "pizza2", title: "Papa's Pizza East Legon", price: 76.40, date: "10 Aug, 2022 8:23 PM"),
        OrderHistory(image: "chicken2", title: "Pizzaman Chickenman - Kissieman", price: 61.40, date: "02 Aug, 2022 7:14 PM"),
        OrderHistory(image: "pizza3", title: "Papa's Pizza East Legon", price: 75.00, date: "30 Jul, 2022 8:28 PM"),
        OrderHistory(image: "chicken", title: "Pizzaman Chickenman - East Legon", price: 61.40, date: "28 June, 2022 1:43 PM"),
    ]
}
