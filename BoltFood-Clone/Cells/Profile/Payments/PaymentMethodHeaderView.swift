//
//  PaymentMethodHeaderView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/10/2022.
//

import UIKit

class PaymentMethodHeaderView: UITableViewHeaderFooterView {

    static let reuseableId: String = "PaymentMethodHeader"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: PaymentMethodHeaderView.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Payment methods"
        lb.textColor = color.black
        lb.font = UIFont(name: font.semi_bold.rawValue, size: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        addSubview(titleLabel)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    

}
