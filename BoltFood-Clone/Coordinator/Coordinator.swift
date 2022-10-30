//
//  Coordinator.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 15/09/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var childControllers: [Coordinator] { get }
    var navigationController: UINavigationController { get }
    
    func startCoordinator()  // initial point of navigation
}

class MainCoordinator: Coordinator {
    
    var childControllers: [Coordinator] = []
    
    var navigationController = UINavigationController()
    
    func startCoordinator() {
        let initialVC = RegisterVC()
        navigationController.pushViewController(initialVC, animated: false)
        
    }
    func showProfile(){
        
    }
    
    
}
