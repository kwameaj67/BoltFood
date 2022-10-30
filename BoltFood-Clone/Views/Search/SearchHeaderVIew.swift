//
//  SearchHeaderVIew.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 01/09/2022.
//

import UIKit

class SearchHeaderVIew: UIView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchContainer: UIView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSearchView))
        let v = SearchView()
        v.layer.cornerRadius = 10.0
        v.backgroundColor = color.background.withAlphaComponent(0.9)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        return v
    }()
    
    let filterButton: UIButton = {
        var btn = UIButton(frame:.zero)
        let image = UIImage(named: "setting")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.addTarget(self, action: #selector(didTapFilterButton), for: .touchUpInside)
        btn.tintColor = .black
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func didTapSearchView(){
        print("I was tapped")
    }
    @objc func didTapFilterButton(){
        print("image was tapped")
    }
   
    
    func setupViews()
    {
        [searchContainer,filterButton].forEach {
            addSubview($0)
        }
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            searchContainer.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            searchContainer.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            searchContainer.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-15),
            
            filterButton.heightAnchor.constraint(equalToConstant: 32),
            filterButton.widthAnchor.constraint(equalToConstant: 28),
            filterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            filterButton.leadingAnchor.constraint(equalTo: searchContainer.trailingAnchor,constant: 20),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
     
        ])
    }
}
