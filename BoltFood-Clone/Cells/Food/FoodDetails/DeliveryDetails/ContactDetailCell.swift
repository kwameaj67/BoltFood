//
//  ContactDetailCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class ContactDetailCell: UITableViewCell {

    
    static let reuseableId = "ContactDetailCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ContactDetailCell.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
   
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Allergies and contact details"
        lb.scaleFont()
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let helpIcon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "info.circle",withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let arrowIcon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right",withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
        iv.tintColor = color.grey.withAlphaComponent(0.5)
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
        contentView.addSubview(helpIcon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowIcon)
        contentView.addSubview(border)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            helpIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            helpIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            helpIcon.widthAnchor.constraint(equalToConstant: 25),
            helpIcon.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: helpIcon.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: helpIcon.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor,constant: -10),
            
            arrowIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            arrowIcon.widthAnchor.constraint(equalToConstant: 20),
            arrowIcon.heightAnchor.constraint(equalToConstant: 20),
           
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            border.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

}
