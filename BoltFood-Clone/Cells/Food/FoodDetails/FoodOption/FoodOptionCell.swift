//
//  FoodOptionCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class FoodOptionCell: UITableViewCell {

    var data: FoodItem? {
        didSet{
            manageData()
        }
    }
    static let reuseableId = "FoodOptionCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: FoodOptionCell.reuseableId)
        setupViews()
        setupConstraints()
        backgroundColor  = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func prepareForReuse() {
        super.prepareForReuse()
        discountedContainer.isHidden = true
        notAvailableLabel.isHidden = true
    }
   
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "10% discount on selected items"
        lb.scaleFont()
        lb.numberOfLines = 1
        lb.font = UIFont(name: "EuclidCircularB-SemiBold", size: 14)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.scaleFont()
        lb.numberOfLines = 0
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        lb.textColor = color.grey
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let notAvailableLabel: UILabel = {
        let lb = UILabel()
        lb.scaleFont()
        lb.numberOfLines = 1
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        lb.textColor = color.black
        lb.isHidden  = true
        lb.alpha = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let priceLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
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
        lb.scaleFont()
        lb.font = UIFont(name: "EuclidCircularB-SemiBold", size: 14)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let foodImage : UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.layer.cornerCurve = .continuous
        iv.backgroundColor = .white
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
        contentView.addSubview(notAvailableLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(border)
        contentView.addSubview(foodImage)
        contentView.addSubview(priceLabel)
        contentView.addSubview(discountedContainer)
        discountedContainer.addSubview(discountPriceLabel)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            notAvailableLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            notAvailableLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            notAvailableLabel.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: notAvailableLabel.bottomAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -10),
            
            foodImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            foodImage.widthAnchor.constraint(equalToConstant: 140),
            foodImage.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            priceLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            
            discountedContainer.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 8),
            discountedContainer.heightAnchor.constraint(equalToConstant: 24),
            discountedContainer.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5),
        
            
            discountPriceLabel.centerYAnchor.constraint(equalTo: discountedContainer.centerYAnchor),
            discountPriceLabel.leadingAnchor.constraint(equalTo: discountedContainer.leadingAnchor, constant: 10),
            discountPriceLabel.trailingAnchor.constraint(equalTo: discountedContainer.trailingAnchor, constant: -10),
            
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            border.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func manageData(){
        guard let item = data else { return }
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        
        if let discountPrice = item.discountPrice {
            priceLabel.attributedText = setupAttributedText("\(item.price.twoDecimalPlaces())")
            discountPriceLabel.text = "GH₵\(discountPrice.twoDecimalPlaces())"
            discountedContainer.isHidden = false
        }else{
            priceLabel.attributedText = NSAttributedString(string: "GH₵\(item.price.twoDecimalPlaces())", attributes: [.foregroundColor: color.black])
            discountedContainer.isHidden = true
        }
        if let image = item.image{
            foodImage.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        }else {
            foodImage.image = nil
        }
        
        if item.available == true {
            contentView.alpha = 1
            notAvailableLabel.isHidden = true
            notAvailableLabel.alpha = 0
            discountedContainer.backgroundColor = color.red
        }else{
            contentView.alpha = 0.5
            notAvailableLabel.isHidden = false
            notAvailableLabel.alpha = 1
            discountedContainer.backgroundColor = .systemGray5
        }
    }
    func setupAttributedText (_ price: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "GH₵\(price)", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor: color.grey,.foregroundColor: color.grey]))
        return text
    }
    
}
