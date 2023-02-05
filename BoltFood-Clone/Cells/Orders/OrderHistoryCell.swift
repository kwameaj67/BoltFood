//
//  FoodOrderCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/08/2022.
//

import UIKit

class OrderHistoryCell: UITableViewCell {
    static let reuseableId:String = "FoodOrder"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: OrderHistoryCell.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    let orderImage : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = color.grey
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerCurve = .continuous
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 15)
        lb.scaleFont()
        return lb
    }()
    
    let detailContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5.0
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let priceLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 15)
        lb.scaleFont()
        return lb
    }()
    
    let dateLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.grey
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "EuclidCircularB-Light", size: 13)
        lb.alpha = 0.8
        lb.scaleFont()
        return lb
    }()
    
    let retryContainer: UIView = {
       let rc = UIView()
        rc.backgroundColor = color.background.withAlphaComponent(0.6)
        rc.translatesAutoresizingMaskIntoConstraints = false
        rc.layer.cornerRadius = 60/2
        return rc
    }()
    
    let retryIcon : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(systemName: "arrow.counterclockwise")?.withRenderingMode(.alwaysOriginal)
        iv.image = img
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    func setupViews() {
        [orderImage,detailContainer,retryContainer,dateLabel].forEach {
            contentView.addSubview($0)
        }
        [titleLabel,priceLabel].forEach { item in
            detailContainer.addArrangedSubview(item)
        }
        retryContainer.addSubview(retryIcon)
    }
    
    func setupConstraints(){
       
        NSLayoutConstraint.activate([
            
            orderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            orderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            orderImage.widthAnchor.constraint(equalToConstant: 68),
            orderImage.heightAnchor.constraint(equalTo: orderImage.widthAnchor),
            
            
            detailContainer.centerYAnchor.constraint(equalTo: orderImage.centerYAnchor),
            detailContainer.leadingAnchor.constraint(equalTo: orderImage.trailingAnchor, constant: 10),
            detailContainer.trailingAnchor.constraint(equalTo: retryContainer.leadingAnchor, constant: -10),
            
            retryContainer.centerYAnchor.constraint(equalTo: orderImage.centerYAnchor),
            retryContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            retryContainer.widthAnchor.constraint(equalToConstant: 60),
            retryContainer.heightAnchor.constraint(equalTo: retryContainer.widthAnchor),

            retryIcon.centerYAnchor.constraint(equalTo: retryContainer.centerYAnchor),
            retryIcon.centerXAnchor.constraint(equalTo: retryContainer.centerXAnchor),
            retryIcon.widthAnchor.constraint(equalToConstant: 20),
            retryIcon.heightAnchor.constraint(equalTo: retryContainer.widthAnchor),

            dateLabel.topAnchor.constraint(equalTo: orderImage.bottomAnchor, constant: 7),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

                        
        ])
    }
    
    func setupOrder(for item: OrderHistory){
        
        let price = item.price.twoDecimalPlaces()
        orderImage.image = UIImage(named: item.image)
        titleLabel.text = item.title
        priceLabel.text = "GH₵ \(price)"
        dateLabel.text = "\(item.date) Delivered"
        
    }
    

}
