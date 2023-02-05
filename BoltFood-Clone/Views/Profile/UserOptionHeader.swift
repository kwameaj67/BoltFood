//
//  UserOptionHeader.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 30/08/2022.
//

import UIKit

class UserOptionHeaderView: UITableViewHeaderFooterView {

    static let reuseableId: String = "UserOptionHeader"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: UserOptionHeaderView.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let usernameLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.font = UIFont(name: font.bold.rawValue, size: 24)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let phoneLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.grey
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: font.light.rawValue, size: 14)
        lb.alpha = 0.8
        return lb
    }()
    let container: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .white
        sv.axis = .vertical
        sv.spacing = 2.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    func setupViews(){
        contentView.addSubview(container)
        [usernameLabel,phoneLabel].forEach {
            container.addArrangedSubview($0)
        }
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
}
