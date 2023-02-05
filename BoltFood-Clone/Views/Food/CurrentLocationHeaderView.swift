//
//  CurrentLocationHeaderView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 07/09/2022.
//

import UIKit

class CurrentLocationHeaderView: UIView {
    struct CurrentLocation {
        let name: String
    }
    static let reusableId = "LocationHeaderView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var currentLocation: CurrentLocation? {
        didSet {
            bind()
        }
    }
    // MARK: Properties -
    let locationIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        let img = UIImage(named: "map-pin")?.withRenderingMode(.alwaysOriginal)
        iv.image = img
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints  = false
        return iv
    }()
    let locationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Accra"
        lb.textColor = color.black
        lb.font = UIFont(name: font.light.rawValue, size: 15)
        lb.scaleFont()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private func bind(){
        locationLabel.text = currentLocation?.name
    }
    
    func setupViews(){
        addSubview(locationIcon)
        addSubview(locationLabel)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            locationIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor,constant: 10),
            
        ])
    }
}
