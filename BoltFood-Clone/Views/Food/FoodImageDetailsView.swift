//
//  FoodImageDetailsView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 07/09/2022.
//

import UIKit

class FoodImageDetailsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties: -
    let foodImage : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .black.withAlphaComponent(0.2)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let discountContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 22/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let discountPercentLabel: UILabel = {
        let lb = UILabel()
        lb.scaleFont()
        lb.font = UIFont(name: font.semi_bold.rawValue, size: 10)
        lb.textColor = color.red
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let durationContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 22/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let durationLabel: UILabel = {
        let lb = UILabel()
        lb.scaleFont()
        lb.font = UIFont(name: font.semi_bold.rawValue, size: 10)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let overlayView: UIView = {
        let v = UIView()
        v.isHidden = true
        v.alpha = 0
        v.backgroundColor = .black.withAlphaComponent(0.7)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let closedLabel: UILabel = {
        let lb = UILabel()
        lb.scaleFont()
        lb.isHidden = true
        lb.alpha = 0
        lb.font = UIFont(name: font.semi_bold.rawValue, size: 12)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        addSubview(foodImage)
        [discountContainer,durationContainer,overlayView].forEach {
            foodImage.addSubview($0)
            
        }
        discountContainer.addSubview(discountPercentLabel)
        durationContainer.addSubview(durationLabel)
        overlayView.addSubview(closedLabel)
        
        overlayView.bringSubviewToFront(foodImage)
    }
    
    func setupConstraints(){

        NSLayoutConstraint.activate([
        
            foodImage.topAnchor.constraint(equalTo: topAnchor),
            foodImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodImage.heightAnchor.constraint(equalTo: heightAnchor),
  
            discountContainer.topAnchor.constraint(equalTo: foodImage.topAnchor, constant: 12),
            discountContainer.leadingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: 12),
            discountContainer.heightAnchor.constraint(equalToConstant: 22),
            
            discountPercentLabel.centerYAnchor.constraint(equalTo: discountContainer.centerYAnchor),
            discountPercentLabel.leadingAnchor.constraint(equalTo: discountContainer.leadingAnchor, constant: 10),
            discountPercentLabel.trailingAnchor.constraint(equalTo: discountContainer.trailingAnchor, constant: -10),
            
            durationContainer.bottomAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: -12),
            durationContainer.trailingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: -12),
            durationContainer.heightAnchor.constraint(equalToConstant: 22),
            
            durationLabel.centerYAnchor.constraint(equalTo: durationContainer.centerYAnchor),
            durationLabel.leadingAnchor.constraint(equalTo: durationContainer.leadingAnchor, constant: 10),
            durationLabel.trailingAnchor.constraint(equalTo: durationContainer.trailingAnchor, constant: -10),
            
            overlayView.topAnchor.constraint(equalTo: topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overlayView.heightAnchor.constraint(equalTo: heightAnchor),
            
            closedLabel.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor),
            closedLabel.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
        ])
    }

}
