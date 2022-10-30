//
//  DeliveryInfoCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class DeliveryInfoCell: UITableViewCell {
    
    static let reuseableId = "DeliveryInfoCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DeliveryInfoCell.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .top
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let deliveryLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.text = "Delivery"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        return lb
    }()
    let priceLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        return lb
    }()
    let durationLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.text = "30-35min"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        return lb
    }()
    let discountedContainer: UIView = {
        let v = UIView()
        v.backgroundColor = color.red
        v.layer.cornerRadius = 24/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let discountPriceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "GH₵8.00"
        lb.scaleFont()
        lb.font = UIFont(name: "EuclidCircularB-SemiBold", size: 14)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let pickupIcon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "figure.walk",withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
        iv.tintColor = color.black
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let border: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray2.withAlphaComponent(0.2)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    func setupViews(){
        contentView.addSubview(stackView)
        contentView.addSubview(durationLabel)
        contentView.addSubview(pickupIcon)
        contentView.addSubview(border)
        [deliveryLabel,priceLabel,discountedContainer].forEach{
            stackView.addArrangedSubview($0)
        }
        discountedContainer.addSubview(discountPriceLabel)
        priceLabel.attributedText = setupAttributedText("45.00")
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            pickupIcon.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            pickupIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pickupIcon.widthAnchor.constraint(equalToConstant: 25),
            pickupIcon.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: pickupIcon.trailingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 24),
            
            
            deliveryLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            
            discountedContainer.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            discountedContainer.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
           
            
            discountPriceLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            discountPriceLabel.leadingAnchor.constraint(equalTo: discountedContainer.leadingAnchor, constant: 10),
            discountPriceLabel.trailingAnchor.constraint(equalTo: discountedContainer.trailingAnchor, constant: -10),
            
            durationLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 2),
            durationLabel.leadingAnchor.constraint(equalTo: pickupIcon.trailingAnchor, constant: 10),
            
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            border.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    func setupAttributedText (_ price: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "GH₵\(price)", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor: color.grey,.foregroundColor: color.grey]))
        return text
    }
}
