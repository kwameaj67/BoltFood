//
//  HomeVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import UIKit

class HomeVC: UIViewController, AddressSelectDelegate {
   
    let reusableId = "cellId"
    let discountFood = Food.discountdata
    let deliveryFood = Food.deliverydata
    let topRatedFood = Food.topRatedData
    let popularFood = Food.popularData
    let restaurantFood = Food.restaurantsData
    
    let foodLayout = FoodCompositionalLayout.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        customBackButton()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: DiscountCollectionViewCell.reusableId)
        collectionView.register(FreeDeliveryCollectionViewCell.self, forCellWithReuseIdentifier: FreeDeliveryCollectionViewCell.reusableId)
        collectionView.register(TopRatedCollectionViewCell.self, forCellWithReuseIdentifier: TopRatedCollectionViewCell.reusableId)
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.reusableId)
        collectionView.register(AllRestaurantsCollectionViewCell.self, forCellWithReuseIdentifier: AllRestaurantsCollectionViewCell.reusableId)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: HeaderCollectionReusableView.reusableId, withReuseIdentifier: HeaderCollectionReusableView.reusableId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    func customBackButton(){
        // custom back button
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: .none, action: .none)
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: Properties -
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
   lazy var locationStackView : UIStackView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapLocationView))
        let v = UIStackView(frame: .zero)
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        v.axis = .horizontal
        v.spacing = 10
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let locationIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        let img = UIImage(named: "map-pin")?.withRenderingMode(.alwaysTemplate)
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
        lb.font = UIFont(name: font.medium.rawValue, size: 14)
        lb.scaleFont()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    @objc func didTapLocationView(){
        let vc = DeliveryAddressVC()
        vc.modalPresentationStyle = .fullScreen
        vc.selectAddressDelegate = self
        self.present(vc, animated: true, completion: nil)
        
    }
    func selectAddress(address: String) {
        locationLabel.text = address
    }
    
    func setupViews(){
        view.addSubview(container)
        container.addSubview(locationStackView)
        locationStackView.addArrangedSubview(locationIcon)
        locationStackView.addArrangedSubview(locationLabel)
        container.addSubview(collectionView)
        setupCompositionalLayout()
    }
    func setupCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            switch sectionNumber{
            case 0:
                return self.foodLayout.discountLayout()
            case 1:
                return self.foodLayout.deliveryLayout()
            case 2:
                return self.foodLayout.topRatedLayout()
            case 3:
                return self.foodLayout.popularLayout()
            case 4:
                return self.foodLayout.restaurantsLayout()
            default:
                return self.foodLayout.defaultLayout()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func setupConstraints(){
        container.pin(to: view)
        NSLayoutConstraint.activate([
            
            locationStackView.topAnchor.constraint(equalTo: container.topAnchor),
            locationStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30),
            locationStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30),
            locationStackView.heightAnchor.constraint(equalToConstant: 40),
            
            locationIcon.centerYAnchor.constraint(equalTo: locationStackView.centerYAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: locationStackView.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),

            locationLabel.centerYAnchor.constraint(equalTo: locationStackView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 10),

            collectionView.topAnchor.constraint(equalTo: locationStackView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: container.bottomAnchor),

        ])
    }
}
