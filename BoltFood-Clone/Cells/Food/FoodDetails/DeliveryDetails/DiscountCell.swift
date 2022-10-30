//
//  DiscountCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class DiscountCell: UITableViewCell {
 
    static let reuseableId = "DiscountCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DiscountCell.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
   
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "10% discount on selected items"
        lb.scaleFont()
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let tagIcon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "tag.fill",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
        iv.tintColor = color.red
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    func setupViews(){
        contentView.addSubview(tagIcon)
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            tagIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tagIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            tagIcon.widthAnchor.constraint(equalToConstant: 25),
            tagIcon.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: tagIcon.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: tagIcon.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
    
        ])
    }
}
