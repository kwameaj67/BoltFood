//
//  PaymentCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/10/2022.
//

import UIKit

class PaymentOptionCell: UITableViewCell {

    static let reuseableId: String = "PaymentOption"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PaymentOptionCell.reuseableId)
        setupViews()
        setupConstraints()
        backgroundColor = .white
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
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let arrow : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = color.grey
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = true
        iv.alpha = 0
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let circleImage : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "circle")
        iv.tintColor = color.grey.withAlphaComponent(0.4)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
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
        [label,icon,border,arrow,circleImage].forEach {
            contentView.addSubview($0)
        }
        
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalTo: icon.widthAnchor),
            
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            arrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            arrow.heightAnchor.constraint(equalToConstant: 20),
           
            circleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            circleImage.heightAnchor.constraint(equalToConstant: 25),
            circleImage.widthAnchor.constraint(equalToConstant: 25),
            
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    func setup(for item: SectionOption){
        label.text = item.name
        icon.image = UIImage(named: item.icon)?.withRenderingMode(.alwaysOriginal)
    }

}
