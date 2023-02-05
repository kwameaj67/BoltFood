//
//  PaymentHeaderView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/10/2022.
//

import UIKit

class BalanceHeaderView: UITableViewHeaderFooterView {

    static let reuseableId: String = "BalanceHeader"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: BalanceHeaderView.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = color.light_green.withAlphaComponent(0.6)
        v.layer.cornerRadius = 10
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func setupViews(){
        addSubview(container)
        container.addSubview(titleLabel)
        titleLabel.attributedText = setAttributedTitle("Bolt balance\n", "GH₵ 0")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    
    func setAttributedTitle(_ title: String,_ subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont(name: font.regular.rawValue, size: 14)!,NSAttributedString.Key.foregroundColor: color.black]))
        attributedText.append(NSAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font: UIFont(name: font.semi_bold.rawValue, size: 26)!,NSAttributedString.Key.foregroundColor: color.black]))
        return attributedText
    }
}
