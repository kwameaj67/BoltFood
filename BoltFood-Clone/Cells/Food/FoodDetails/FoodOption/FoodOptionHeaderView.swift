//
//  FoodOptionHeaderView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class FoodOptionHeaderView: UITableViewHeaderFooterView {
    static let reusableId = "FoodOptionHeaderView"
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: FoodOptionHeaderView.reusableId)
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.scaleFont()
        lb.font = UIFont(name: "EuclidCircularB-SemiBold", size: 22)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
   
}
