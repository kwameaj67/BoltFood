//
//  UserOptionCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 30/08/2022.
//

import UIKit

class UserOptionCell: UITableViewCell {

    static let reuseableId: String = "UserOptionCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: UserOptionCell.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 15)
        lb.scaleFont()
        return lb
    }()
    let icon : UIImageView = {
        var iv = UIImageView()
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func setupViews(){
        [label,icon].forEach {
            contentView.addSubview($0)
        }
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 25),
            icon.heightAnchor.constraint(equalTo: icon.widthAnchor),
            
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
            
        ])
    }
    func setup(for item: UserOption){
        label.text = item.title
        icon.image = UIImage(systemName: item.icon)
    }
}
