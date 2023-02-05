//
//  HeaderCollectionReusableView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 07/09/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let reusableId = "HeaderView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties: -
    let headingLabel: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.font = UIFont(name: font.bold.rawValue, size: 15)
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.scaleFont()
        return lb
    }()
    
    let headingButton: UIButton = {
        var btn = UIButton()
        btn.setTitleColor(color.dark_green, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.bold.rawValue, size: 12)
        btn.backgroundColor = color.light_green
        btn.setTitle("All", for: .normal)
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        addSubview(headingLabel)
        addSubview(headingButton)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            headingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            headingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            headingButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            headingButton.heightAnchor.constraint(equalToConstant: 20),
            headingButton.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
}
