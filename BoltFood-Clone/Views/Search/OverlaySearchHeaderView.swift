//
//  OverlaySearchHeaderView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 04/11/2022.
//

import UIKit

class OverlaySearchHeaderView: UIView {

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .white
        // shadows
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset =  CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let searchIcon : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(systemName: "magnifyingglass")
        iv.image = img
        iv.tintColor = color.black
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let searchTextField: UITextField = {
        var tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Restaurants or cuisines", attributes: [.foregroundColor: UIColor.systemGray3,.font:UIFont(name: font.medium.rawValue, size: 14)!])
        tf.borderStyle = .none
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.font = UIFont(name: font.medium.rawValue, size: 14)
        tf.clearButtonMode = .whileEditing
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let cancelButton: UIButton = {
        var btn = UIButton(frame:.zero)
        btn.setTitle("Cancel", for: .normal)
        btn.titleLabel!.font = UIFont(name: font.light.rawValue, size: 14)
        btn.setTitleColor(color.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        addSubview(searchIcon)
        addSubview(searchTextField)
        addSubview(cancelButton)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            searchIcon.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            searchIcon.widthAnchor.constraint(equalToConstant: 25),
            searchIcon.heightAnchor.constraint(equalToConstant: 25),
            
            searchTextField.centerYAnchor.constraint(equalTo: searchIcon.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 15),
            searchTextField.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cancelButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
           
        ])
    }
}
