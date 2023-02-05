//
//  FoodTitleCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 15/10/2022.
//

import UIKit

class FoodTitleCell: UITableViewCell {
    static let reusableId = "FoodTitleCell"
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: FoodTitleCell.reusableId)
        setupViews()
        setupContraints()
        layer.cornerRadius = 20
        clipsToBounds = true
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Properties -
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pizzaman Chickenman - UPSA"
        lb.textColor = color.black
        lb.font = UIFont(name: "EuclidCircularB-SemiBold", size: 22)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let starImage : UIImageView = {
        var iv = UIImageView()
        iv.image =  UIImage(systemName: "star.fill")
        iv.tintColor =  color.black
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let otherLabel: UILabel = {
        let lb = UILabel()
        lb.text = "4.2﹒Pickup not available"
        lb.textColor = color.black
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(starImage)
        contentView.addSubview(otherLabel)

    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            starImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            starImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            starImage.heightAnchor.constraint(equalToConstant: 16),
            starImage.widthAnchor.constraint(equalToConstant: 16),
            
            otherLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 8),
            otherLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
        ])
    }
}
