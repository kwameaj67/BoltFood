//
//  CustomNavbarView.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit


protocol CustomHeaderActionDelegate: AnyObject{
    func didScrollTapped(indexPath: IndexPath)
}

class CustomNavbarView: UIView {
    
    var controller: FoodDetailVC?{
        didSet{
            arrowButton.addTarget(controller, action: #selector(FoodDetailVC.popDetailsVC), for: .touchUpInside)
        }
    }
    weak var delegate : CustomHeaderActionDelegate?
    
    let data = FoodSection.sectionArray
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        
        // shadows
        backgroundColor = .clear
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowRadius = 3
        layer.masksToBounds  = false
        layer.shadowOffset =  CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.2
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pizzaman Chickenman - UPSA"
        lb.scaleFont()
        lb.numberOfLines = 1
        lb.isHidden = true
        lb.alpha = 0
        lb.font = UIFont(name: font.semi_bold.rawValue, size: 17)
        lb.textColor = color.black
        lb.transform = CGAffineTransform(translationX: 0, y: -20)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let arrowButton : UIButton = {
        var b = UIButton(frame: .zero)
        let image = UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 22,weight: .regular))?.withRenderingMode(.alwaysTemplate)
        b.backgroundColor = .clear
        b.tintColor = .white
        b.adjustsImageWhenHighlighted = false
        b.setImage(image, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let saveButton : UIButton = {
        var b = UIButton(frame: .zero)
        let image = UIImage(systemName: "square.and.arrow.down",withConfiguration: UIImage.SymbolConfiguration(pointSize: 22,weight: .regular))?.withRenderingMode(.alwaysTemplate)
        b.backgroundColor = .clear
        b.tintColor = .white
        b.adjustsImageWhenHighlighted = false
        b.setImage(image, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let searchButton : UIButton = {
        var b = UIButton(frame: .zero)
        let image = UIImage(systemName: "magnifyingglass",withConfiguration: UIImage.SymbolConfiguration(pointSize: 22,weight: .regular))?.withRenderingMode(.alwaysTemplate)
        b.backgroundColor = .clear
        b.tintColor = .white
        b.adjustsImageWhenHighlighted = false
        b.setImage(image, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var collectionView : UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = .clear
        cv.register(FoodSectionCollectionCell.self, forCellWithReuseIdentifier:FoodSectionCollectionCell.reusableId)
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = true
        cv.allowsSelection = true
        cv.bounces = true
        cv.isHidden = true
        cv.alpha = 0
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.transform = CGAffineTransform(translationX: 0, y: -20)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    func setupViews(){
        
        [titleLabel,arrowButton,saveButton,searchButton,collectionView].forEach{
            addSubview($0)
        }
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: arrowButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -5),
            
            arrowButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            arrowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            arrowButton.heightAnchor.constraint(equalToConstant: 30),
            arrowButton.widthAnchor.constraint(equalToConstant: 30),

            saveButton.centerYAnchor.constraint(equalTo:searchButton.centerYAnchor),
            saveButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -15),
            saveButton.heightAnchor.constraint(equalToConstant: 30),
            saveButton.widthAnchor.constraint(equalToConstant: 30),

            searchButton.centerYAnchor.constraint(equalTo:arrowButton.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            searchButton.widthAnchor.constraint(equalToConstant: 30),

            collectionView.topAnchor.constraint(equalTo: arrowButton.bottomAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

extension CustomNavbarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSectionCollectionCell.reusableId, for: indexPath) as! FoodSectionCollectionCell
        cell.titleLabel.text = data[indexPath.row].sectionName
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let _ = collectionView.cellForItem(at: IndexPath(row: indexPath.row, section: 0))
        let item = data[indexPath.row].sectionName
        let itemSize = item.size(withAttributes: [NSAttributedString.Key.font:UIFont(name: font.semi_bold.rawValue, size: 14)!])
        return CGSize(width:  itemSize.width + 5, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: IndexPath(item: indexPath.row, section: 0), at: [.centeredHorizontally,.centeredVertically], animated: true)
        collectionView.layoutSubviews()
        let item = data[indexPath.row].sectionName
        print(item)
        delegate?.didScrollTapped(indexPath: IndexPath(row: 0, section: indexPath.row))
    }
}
