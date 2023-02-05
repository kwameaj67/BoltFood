//
//  UIView+Ext.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addBottomShadows(){
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowRadius = 3
        layer.masksToBounds  = false
        layer.shadowOffset =  CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.4
        backgroundColor = .white
        layer.shadowPath = CGPath(rect: CGRect(x: 0,y: bounds.maxY - layer.shadowRadius,width: bounds.width,height: layer.shadowRadius), transform: .none)
    }
    func removeBottomShadows(){
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset =  CGSize(width: 0, height: 3)
        layer.shadowRadius = 0
        layer.masksToBounds  = false
        layer.shadowOpacity = 0
        layer.shadowPath = nil
    }
}
