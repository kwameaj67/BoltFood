//
//  FoodDetailsView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 07/09/2022.
//

import UIKit

class FoodDescriptionDetailsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties: -
     let foodTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Green Pepper Chinese"
        lb.scaleFont()
        lb.numberOfLines = 1
        lb.font = UIFont(name: font.bold.rawValue, size: 15)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let actualPriceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "GH₵5.00"
        lb.scaleFont()
        lb.font = UIFont(name: font.regular.rawValue, size: 14)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let discountedContainer: UIView = {
        let v = UIView()
        v.backgroundColor = color.red
        v.layer.cornerRadius = 25/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let discountPriceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "GH₵1.00"
        lb.scaleFont()
        lb.font = UIFont(name: font.semi_bold.rawValue, size: 12)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let ratingContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let ratingLabel: UILabel = {
        let lb = UILabel()
        lb.text = "4.3"
        lb.scaleFont()
        lb.font = UIFont(name: font.bold.rawValue, size: 14)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let ratingIcon : UIImageView = {
        var iv = UIImageView(frame:.zero)
        let img = UIImage(systemName: "star.fill")
        iv.image = img
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    func setupViews(){
        [foodTitleLabel,ratingContainer,actualPriceLabel,discountedContainer].forEach {
            addSubview($0)
        }
        discountedContainer.addSubview(discountPriceLabel)
        ratingContainer.addArrangedSubview(ratingIcon)
        ratingContainer.addArrangedSubview(ratingLabel)
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
        
            foodTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            foodTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodTitleLabel.centerYAnchor.constraint(equalTo: ratingContainer.centerYAnchor),
//            foodTitleLabel.trailingAnchor.constraint(equalTo: ratingContainer.leadingAnchor, constant: -5),
           
            
            actualPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            actualPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            actualPriceLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            
            discountedContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            discountedContainer.leadingAnchor.constraint(equalTo: actualPriceLabel.trailingAnchor, constant: 8),
            discountedContainer.heightAnchor.constraint(equalToConstant: 24),
            
            discountPriceLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            discountPriceLabel.leadingAnchor.constraint(equalTo: discountedContainer.leadingAnchor, constant: 10),
            discountPriceLabel.trailingAnchor.constraint(equalTo: discountedContainer.trailingAnchor, constant: -10),
            
            ratingContainer.topAnchor.constraint(equalTo: topAnchor),
            ratingContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            ratingContainer.heightAnchor.constraint(equalToConstant: 14),
            
            ratingLabel.centerYAnchor.constraint(equalTo: ratingContainer.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: ratingContainer.trailingAnchor),
            
            ratingIcon.centerYAnchor.constraint(equalTo: ratingContainer.centerYAnchor),
            ratingIcon.leadingAnchor.constraint(equalTo: ratingContainer.leadingAnchor),
            
        ])
    }

}
