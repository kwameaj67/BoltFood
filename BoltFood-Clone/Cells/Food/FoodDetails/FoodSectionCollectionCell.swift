//
//  FoodSectionCollectionCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class FoodSectionCollectionCell: UICollectionViewCell {
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.titleLabel.textColor = self.isSelected ? .black : color.grey
                self.titleLabel.font = self.isSelected ? UIFont(name: font.semi_bold.rawValue, size: 14) : UIFont(name: font.regular.rawValue, size: 14)
            }
        }
    }
    
    static let reusableId = "FoodSectionCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        setupContraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.grey
        lb.font = UIFont(name: font.regular.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    func setupContraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
