//
//  BFButton.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import Foundation
import UIKit

class BFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        layer.cornerRadius = 60/2
        titleLabel?.font = UIFont(name: "EuclidCircularB-SemiBold", size: 18)
        translatesAutoresizingMaskIntoConstraints = false
    }
}



