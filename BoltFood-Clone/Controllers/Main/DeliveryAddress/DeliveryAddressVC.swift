//
//  DeliveryAddressVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 08/09/2022.
//

import UIKit

protocol AddressSelectDelegate: AnyObject {
    func selectAddress(address: String)
}
class DeliveryAddressVC: UIViewController {

    private var addressList:[DeliveryAddress] = []
    
    weak var selectAddressDelegate : AddressSelectDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        configureNavBar()
        addDeliveryAddress()
        addressTableView.delegate = self
        addressTableView.dataSource = self
        addressTableView.register(DeliveryAddressCell.self, forCellReuseIdentifier: DeliveryAddressCell.reuseableId)
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for address in addressList{
            print(address.location,address.selected)
        }
    }
    func addDeliveryAddress(){
        addressList.append(DeliveryAddress(location: "Current location", area: "Adamafio Link", icon: "navigate",selected: false))
        addressList.append(DeliveryAddress(location: "Home", area: "Ayawaso", icon: "home-outline",selected: false))
        addressList.append(DeliveryAddress(location: "Work", area: "West Airport, Accra", icon: "work", selected: false))
        addressList.append(DeliveryAddress(location: "Accra", area: nil, icon: "map-pin", selected: false))
        addressList.append(DeliveryAddress(location: "North Airport Road", area: nil, icon: "map-pin", selected: false))
        addressList.append(DeliveryAddress(location: "Accra", area: "Ghana", icon: "map-pin", selected: false))
        addressList.append(DeliveryAddress(location: "Department", area: "Accra", icon: "map-pin", selected: false))
        addressList.append(DeliveryAddress(location: "Law School", area: "University of Ghana", icon: "map-pin", selected: false))
        addressList.append(DeliveryAddress(location: "North Legon", area: "Accra, Ghana", icon: "map-pin", selected: false))
    }
    // MARK: Properties -
    lazy var searchContainer: UIView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSearchView))
        let v = SearchView()
        v.placeholderText.text = "Enter a new address"
        v.layer.cornerRadius = 10.0
        v.backgroundColor = color.background.withAlphaComponent(0.9)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(tap)
        return v
    }()
    let addressTableView: UITableView = {
        let list = UITableView(frame: .zero)
        list.translatesAutoresizingMaskIntoConstraints = false
        list.showsVerticalScrollIndicator = false
        list.backgroundColor = .clear
        list.tableFooterView = UIView()
        return list
    }()
    @objc func didTapSearchView(){
        
    }
    func setupViews(){
        view.addSubview(searchContainer)
        view.addSubview(addressTableView)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
           
            searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchContainer.heightAnchor.constraint(equalToConstant: 60.0),
            
            addressTableView.topAnchor.constraint(equalTo: searchContainer.bottomAnchor, constant: 12),
            addressTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            addressTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            addressTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }

}

extension DeliveryAddressVC: UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = addressList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryAddressCell.reuseableId, for: indexPath) as! DeliveryAddressCell
        cell.data = item
        if item.selected == true {
            cell.selectedIcon.image = UIImage(systemName: "checkmark.circle.fill")
            cell.selectedIcon.isHidden = false
            cell.selectedIcon.alpha = 1
        }
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = addressList[indexPath.row]
        let cell = addressTableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! DeliveryAddressCell
        if !item.selected {
            item.selected = !item.selected
           // print(item.location,item.selected)
            cell.selectedIcon.image = UIImage(systemName: "checkmark.circle.fill")
            cell.selectedIcon.isHidden = false
            cell.selectedIcon.alpha = 1
        }
        else {
            item.selected = !item.selected
            cell.selectedIcon.image = nil
            cell.selectedIcon.isHidden = true
        }
        selectAddressDelegate?.selectAddress(address: item.location)
        closeVC()
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = addressTableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! DeliveryAddressCell
        cell.selectedIcon.image = nil
        cell.selectedIcon.image = nil
        cell.selectedIcon.isHidden = true
    }
    
    private func configureNavBar(){
        let height: CGFloat = 85.0
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: height))
        navbar.barTintColor = .white
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: font.semi_bold.rawValue, size: 16)!]
        navbar.titleTextAttributes = titleTextAttributes
        navbar.delegate = self

        let navbarItem = UINavigationItem()
        navbarItem.title = "Delivery address"
        
        let exitButton = UIButton(frame:.zero)
        exitButton.setBackgroundImage(UIImage(named: "close")?.withTintColor(.black), for: .normal)
        exitButton.tintColor = .black
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        exitButton.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        exitButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        navbarItem.leftBarButtonItem = UIBarButtonItem(customView: exitButton)
        
        navbar.setBackgroundImage(UIImage(), for: .default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        navbar.translatesAutoresizingMaskIntoConstraints = false
        
        navbar.items = [navbarItem]
        view.addSubview(navbar)
        
        self.view.frame = CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - height))
        
        NSLayoutConstraint.activate([
            exitButton.heightAnchor.constraint(equalToConstant: 30.0),
            exitButton.widthAnchor.constraint(equalToConstant: 30.0),
            
            navbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            navbar.heightAnchor.constraint(equalToConstant: 50.0),
            navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchContainer.topAnchor.constraint(equalTo: navbar.bottomAnchor,constant: 5),
        ])
       
    }
    @objc func closeVC(){
        self.dismiss(animated: true, completion: nil)
    }
}
