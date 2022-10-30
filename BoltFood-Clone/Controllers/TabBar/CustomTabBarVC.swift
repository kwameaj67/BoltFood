//
//  CustomTabBarVCViewController.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import UIKit

class CustomTabBarVC: UITabBarController {

    var tabItem = UITabBarItem()
    var tabBarAppearance = UITabBar.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeVC()
        let HomeVC = UINavigationController(rootViewController: vc1)

        let vc2 = SearchVC()
        let SearchVC = UINavigationController(rootViewController: vc2)

        let vc3 = OrderVC()
        let OrderVC = UINavigationController(rootViewController: vc3)

        let vc4 = UserVC()
        let UserVC = UINavigationController(rootViewController: vc4)
        
        
        let tabBarList = [HomeVC,SearchVC,OrderVC,UserVC]
        
        viewControllers = tabBarList

        setupViews()
        
        // tabs
        customTab(activeImage: "home-bold", inactiveImage: "home-outline", indexOfTab: 0, tabTitle: nil)
        customTab(activeImage: "search-bold", inactiveImage: "search-outline", indexOfTab: 1, tabTitle: nil)
        customTab(activeImage: "order-bold", inactiveImage: "order-outline", indexOfTab: 2, tabTitle: nil)
        customTab(activeImage: "user-bold", inactiveImage: "user-outline", indexOfTab: 3, tabTitle: nil)
        
        tabBarAppearance.tintColor = color.black
        tabBarAppearance.unselectedItemTintColor = color.grey
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        print(tabBar.frame.size.height)
        tabBar.frame.origin.y = view.frame.height - 80
    }
    func setupViews(){
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = true
    }
   
    func customTab(activeImage image1: String, inactiveImage image2: String, indexOfTab index: Int, tabTitle title: String?){
        let selectedImage = UIImage(named:image1)?.withTintColor(.black).withRenderingMode(.alwaysOriginal)
        let deselectedImage = UIImage(named: image2)?.withTintColor(.systemGray).withRenderingMode(.alwaysOriginal)
        
        
        tabItem =  self.tabBar.items![index]
        tabItem.image = deselectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = .none
        tabItem.imageInsets.bottom = -10
        tabItem.imageInsets = UIEdgeInsets(top: -1, left: -10, bottom: -1, right: -10)
        
    }

}
