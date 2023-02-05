//
//  AboutCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 11/09/2022.
//

import UIKit

class AboutCell: UITableViewCell {

    static let reusableId = "AboutCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: AboutCell.reusableId)
        contentView.addSubview(label)
        contentView.addSubview(icon)
        contentView.addSubview(border)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        lb.scaleFont()
        return lb
    }()
    let icon : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(systemName: "chevron.forward")
        iv.image = img
        iv.tintColor = .systemGray
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let border: UIView = {
       var b = UIView()
        b.backgroundColor = .systemGray2.withAlphaComponent(0.2)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    func setupConstraints(){
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 18),
            icon.heightAnchor.constraint(equalToConstant: 18),
            
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -2),
            border.heightAnchor.constraint(equalToConstant: 1.0),
        ])
    }
}
