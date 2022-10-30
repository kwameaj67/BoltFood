//
//  Food.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 26/09/2022.
//

import Foundation

struct Food{
    var title: String
    var price: Double
    var discountPrice: Double?
    var rating: Double
    var image: String
    var discountPercent: Int?
    var duration: String
    var closed: Bool
    var availableTime: Int
   
        
    static let discountdata: [Food] = [
        Food(title: "Green Pepper Chinese", price: 54.00, discountPrice: 44, rating: 4.3, image: "food", discountPercent: 4, duration: "10-35 min",closed:false,availableTime:12),
        Food(title: "Pizza Inn Accra Mall", price: 66.00, discountPrice: 44, rating: 5.0, image: "rice", discountPercent: 6, duration: "20-45 min",closed:false,availableTime:9),
        Food(title: "Grab & Go Foods East Legon", price: 20.00, discountPrice: 24, rating: 2.2, image: "pizza-1", discountPercent: 5, duration: "20-30 min",closed:false,availableTime:8),
        Food(title: "Chicken Inn Accra Mall", price: 40.00, discountPrice: 20, rating: 3.0, image: "chicken2", discountPercent: 2, duration: "15-30 min",closed:false,availableTime:12),
        Food(title: "Barituas Campus Hub", price: 15.00, discountPrice: 45, rating: 1.0, image: "pizza2", discountPercent: 1, duration: "10-50 min",closed:false,availableTime:12),
        Food(title: "Havilla Kitchen", price: 60.00, discountPrice: 40, rating: 4.9, image: "chicken", discountPercent: 9, duration: "5-30 min",closed:false,availableTime:12),
        Food(title: "Mummy's Grill", price: 96.00, discountPrice: 20, rating: 5.0, image: "pizza3", discountPercent: 8, duration: "40-50 min",closed:false,availableTime:12),
    ]
    
    static let deliverydata: [Food] = [
        Food(title: "Havilla Kitchen", price: 20.00, discountPrice: 24.0, rating: 4.9, image: "chicken", discountPercent: nil, duration: "5-30 min",closed:false,availableTime:12),
        Food(title: "Mummy's Grill", price: 96.00, discountPrice: 66.0, rating: 5.0, image: "pizza3", discountPercent: 3, duration: "40-50 min",closed:false,availableTime:12),
        Food(title: "Chicken Inn Accra Mall", price: 40.00, discountPrice: 46.0, rating: 3.0, image: "chicken2", discountPercent: nil, duration: "15-30 min",closed:false,availableTime:12),
        Food(title: "Barituas Campus Hub", price: 32.00, discountPrice: 30.0, rating: 1.0, image: "pizza2", discountPercent: nil, duration: "10-50 min",closed:false,availableTime:12),
        Food(title: "Green Pepper Chinese", price: 67.00, discountPrice: 90.0, rating: 4.3, image: "food", discountPercent: nil, duration: "10-35 min",closed:false,availableTime:12),
        Food(title: "Pizza Inn Accra Mall", price: 96.00, discountPrice: 82.0, rating: 5.0, image: "rice", discountPercent: nil, duration: "20-45 min",closed:false,availableTime:12),
        Food(title: "Grab & Go Foods East Legon", price: 60.00, discountPrice: 60.0, rating: 2.2, image: "pizza-1", discountPercent: 2, duration: "20-30 min",closed:false,availableTime:12),
    ]
    static let topRatedData: [Food] = [
        Food(title: "Chicken Inn Accra Mall", price: 60.00, discountPrice: 20, rating: 3.0, image: "chicken2", discountPercent: 8, duration: "15-30 min",closed:false,availableTime:12),
        Food(title: "Grab & Go Foods East Legon", price: 30.00, discountPrice: nil, rating: 2.2, image: "pizza-1", discountPercent: nil, duration: "20-30 min",closed:false,availableTime:12),
        Food(title: "Barituas Campus Hub", price: 85.00, discountPrice: nil, rating: 1.0, image: "pizza2", discountPercent: nil, duration: "10-50 min",closed:false,availableTime:12),
        Food(title: "Havilla Kitchen", price: 60.00, discountPrice: nil, rating: 4.9, image: "chicken", discountPercent: nil, duration: "5-30 min",closed:false,availableTime:12),
       
        Food(title: "Green Pepper Chinese", price: 54.00, discountPrice: 24, rating: 4.3, image: "food", discountPercent: 6, duration: "10-35 min",closed:true,availableTime:8),
        Food(title: "Pizza Inn Accra Mall", price: 34.00, discountPrice: nil, rating: 5.0, image: "rice", discountPercent: nil, duration: "20-45 min",closed:false,availableTime:12),
        Food(title: "Mummy's Grill", price: 96.00, discountPrice: nil, rating: 5.0, image: "pizza3", discountPercent: nil, duration: "40-50 min",closed:false,availableTime:12),
    ]
    static let popularData: [Food] = [
        Food(title: "Mummy's Grill", price: 96.00, discountPrice: 54.0, rating: 5.0, image: "pizza3", discountPercent: 3, duration: "40-50 min",closed:true,availableTime:11),
        Food(title: "Chicken Inn Accra Mall", price: 40.00, discountPrice: 84.0, rating: 3.0, image: "chicken2", discountPercent: 1, duration: "15-30 min",closed:false,availableTime:8),
        Food(title: "Green Pepper Chinese", price: 54.00, discountPrice: 55.0, rating: 4.3, image: "food", discountPercent: 7, duration: "10-35 min",closed:false,availableTime:12),
        Food(title: "Havilla Kitchen", price: 60.00, discountPrice: 86.0, rating: 4.9, image: "chicken", discountPercent: 5, duration: "5-30 min",closed:false,availableTime:12),
        Food(title: "Grab & Go Foods East Legon", price: 20.00, discountPrice: 24.0, rating: 2.2, image: "pizza-1", discountPercent: 2, duration: "20-30 min",closed:false,availableTime:12),
        Food(title: "Barituas Campus Hub", price: 15.00, discountPrice: 34.0, rating: 1.0, image: "pizza2", discountPercent: 4, duration: "10-50 min",closed:false,availableTime:12),
        Food(title: "Pizza Inn Accra Mall", price: 34.00, discountPrice: 50.0, rating: 5.0, image: "rice", discountPercent: 3, duration: "20-45 min",closed:false,availableTime:12),
    ]
    static let restaurantsData: [Food] = [
       
        Food(title: "Barituas Campus Hub", price: 15.00, discountPrice: 50.0, rating: 4.0, image: "pizza2", discountPercent: 4, duration: "10-50 min",closed:true,availableTime:8),
        Food(title: "Pizza Inn Accra Mall", price: 34.00, discountPrice: 40.0, rating: 5.0, image: "rice", discountPercent: 3, duration: "20-45 min",closed:false,availableTime:12),
        Food(title: "Havilla Kitchen", price: 60.00, discountPrice: nil, rating: 4.9, image: "chicken", discountPercent: nil, duration: "5-30 min",closed:false,availableTime:11),
        Food(title: "Mummy's Grill", price: 96.00, discountPrice: 70.0, rating: 5.0, image: "pizza3", discountPercent: 3, duration: "40-50 min",closed:false,availableTime:9),
       
        Food(title: "Green Pepper Chinese", price: 54.00, discountPrice: 58.0, rating: 4.3, image: "food", discountPercent: 7, duration: "10-35 min",closed:true,availableTime:8),
        Food(title: "Chicken Inn Accra Mall", price: 40.00, discountPrice: 70.0, rating: 3.0, image: "chicken2", discountPercent: 1, duration: "15-30 min",closed:false,availableTime:9),
        Food(title: "Grab & Go Foods East Legon", price: 20.00, discountPrice: 32.0, rating: 2.2, image: "pizza-1", discountPercent: 2, duration: "20-30 min",closed:true,availableTime:11),
    ]

}
struct FoodItem{
    var title: String
    var description:String
    var price: Double
    var discountPrice: Double?
    var image: String?
    var available: Bool
}
struct FoodSection{
    var sectionName: String
    var sectionItems:[FoodItem]
    
    static let specialOffer:[FoodItem] = [
        FoodItem(title: "Noodles Bucket", description: "", price: 66.0, discountPrice: 59.4, image: "food", available:true),
        FoodItem(title: "Me Treat", description: "Six pieces of wings", price: 120.0, discountPrice: 27, image: "chicken2", available:true),
        FoodItem(title: "Pacherko", description: "", price: 200.0, discountPrice: nil, image: nil, available:false)
    ]
    
    
    static let specialPackage:[FoodItem] = [
        FoodItem(title: "Noodles Bucket", description: "", price: 66.0, discountPrice: 59.4, image: nil, available:false),
        FoodItem(title: "Kersame Pizza ", description: "Beef, chicken", price: 55, discountPrice: nil, image: "pizza3", available:true),
        FoodItem(title: "Pepa Babe Pizza", description: "Beef, chicken, pepperoni.", price: 66, discountPrice: nil, image: "pizza", available:true),
        FoodItem(title: "Panchito Pizza ", description: "Beef, chicken", price: 55, discountPrice: 50, image: "pizza2", available:false),
        FoodItem(title: "Me Treat", description: "Six pieces of wings", price: 120.0, discountPrice: 27, image: nil, available:true),
        FoodItem(title: "Pacherko", description: "", price: 200.0, discountPrice: nil, image: nil, available:false)
    ]
    static let pizzamanSpecial:[FoodItem] = [
        FoodItem(title: "Crisibreezi Pizza", description: "Beef, chicken beast, brisket, ham, pepperoni, mortadella", price: 30.0, discountPrice: nil, image: "pizza", available:true),
        FoodItem(title: "Gretaben Pizza", description: "Beef, chicken, pepperoni.", price: 66, discountPrice: nil, image: "pizza2", available:true),
        FoodItem(title: "Kersame Pizza ", description: "Beef, chicken", price: 55, discountPrice: 30, image: "pizza3", available:false),
        FoodItem(title: "Pepa Babe Pizza", description: "Beef, chicken, pepperoni.", price: 66, discountPrice: nil, image: "pizza", available:true),
        FoodItem(title: "Panchito Pizza ", description: "Beef, chicken", price: 55, discountPrice: nil, image: "pizza2", available:true),
        FoodItem(title: "Chicham", description: "Chicken and Ham", price: 55, discountPrice: nil, image: nil, available:true),
        FoodItem(title: "Obiridan Pizza ", description: "Beef, chicken, tuna, barbeque, sauce", price:72, discountPrice: nil, image: "pizza3", available:true),
    ]
    static let veganBites:[FoodItem] = [
        FoodItem(title: "Asti Mushroom Pizza", description: "Mushroom, onion", price: 50.0, discountPrice: nil, image: "pizza3", available:true),
        FoodItem(title: "Mushroom Pizza", description: "Mushroom, onion", price: 50.0, discountPrice: 45, image: "pizza2", available:false),
    ]
    static let meatBites:[FoodItem] = [
        FoodItem(title: "Daisy Lawre Chicken Pizza", description: "Chicken fillet, onion, green pepper.", price: 50.0, discountPrice: nil, image: "pizza", available:true),
        FoodItem(title: "Klarabella Beef Pizza", description: "Beef, onions, sweet corn", price: 55.0, discountPrice: nil, image: "pizza3", available:true)
    ]
    static let combos:[FoodItem] = [
        FoodItem(title: "Mini Bucket", description: "Jollof or fried rice, winds(eight pieces and Coleslaw", price: 66.0, discountPrice: nil, image: "pizza", available:true),
        FoodItem(title: "Maxi Bucket", description: "Jollof or fried rice, winds(eight pieces and Coleslaw", price: 110.0, discountPrice: nil, image: "pizza2", available:true),
        FoodItem(title: "Chickenman Jollof or fried rice, winds(eight pieces)", description: "Jollof or fried rice, winds(eight pieces and Coleslaw", price: 88.0, discountPrice: 45, image: "chicken", available:true),
    ]
    
    static let sectionArray:[FoodSection] = [
        FoodSection(sectionName: "Special Offer", sectionItems: specialOffer),
        FoodSection(sectionName: "Special Package", sectionItems: specialPackage),
        FoodSection(sectionName: "Pizzaman Specials", sectionItems: pizzamanSpecial),
        FoodSection(sectionName: "Vegan Bites", sectionItems: veganBites),
        FoodSection(sectionName: "Meat Bites", sectionItems: meatBites),
        FoodSection(sectionName: "Combos", sectionItems: combos),
        FoodSection(sectionName: "For Kids", sectionItems: combos),
        FoodSection(sectionName: "Chicken", sectionItems: combos),
        FoodSection(sectionName: "Sides", sectionItems: combos),
    ]
}
