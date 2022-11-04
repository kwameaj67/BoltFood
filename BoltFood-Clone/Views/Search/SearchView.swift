//
//  SearchView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 07/09/2022.
//

import UIKit

class SearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
   
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let searchIcon : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(systemName: "magnifyingglass")
        iv.image = img
        iv.tintColor = color.grey
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let placeholderText: UILabel = {
        let lb = UILabel()
        lb.text = "Restaurants or cuisines"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = color.grey
        lb.font = UIFont(name: font.light.rawValue, size: 14)
        lb.scaleFont()
        return lb
    }()
    
    func setupViews(){       
        addSubview(stackView)
        [searchIcon,placeholderText].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchIcon.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),

            placeholderText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
        ])
    }

}
