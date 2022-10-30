//
//  PopularCategoryHeader.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 03/09/2022.
//

import UIKit

class MealCategoryHeader: UITableViewHeaderFooterView {

    static let reuseableId: String = "PopularCategoryHeader"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: MealCategoryHeader.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let headingLabel: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = color.black
        lb.font = UIFont(name: font.bold.rawValue, size: 18)
        lb.scaleFont()
        return lb
    }()
    func setupViews(){
        contentView.addSubview(headingLabel)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            headingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
        ])
    }

}
