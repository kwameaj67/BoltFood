//
//  FoodDetailVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 15/10/2022.
//

import UIKit

class FoodDetailVC: UIViewController {
    let sectionHeight = CGFloat(FoodSection.sectionArray.count)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupContraints()
        setNavBar()
        
        let headerView = StrechyHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
        headerView.isUserInteractionEnabled = true
        self.tableView.tableHeaderView = headerView
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.layer.zPosition = 0
    }
    // MARK: Properties -
    lazy var customNavBar: CustomNavbarView = {
        let v = CustomNavbarView()
        v.controller = self
        v.delegate = self
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.showsVerticalScrollIndicator = false
        tv.register(FoodTitleCell.self, forCellReuseIdentifier: FoodTitleCell.reusableId)
        tv.register(DeliverDetailsCell.self, forCellReuseIdentifier: DeliverDetailsCell
                        .reusableId)
//        tv.register(FoodOptionCell.self, forCellReuseIdentifier: FoodOptionCell
//                        .reuseableId)
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = color.bg_grey
        tv.separatorColor = .clear
        tv.tableHeaderView = UIView()
        tv.tableFooterView = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupViews(){
        view.addSubview(tableView)
        view.addSubview(customNavBar)
        customNavBar.bringSubviewToFront(tableView)
        
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 150),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    func setNavBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    @objc func popDetailsVC(){
        navigationController?.popViewController(animated: true)
    }
}

extension FoodDetailVC: UITableViewDelegate, UITableViewDataSource,CustomHeaderActionDelegate {
    func didScrollTapped(indexPath: IndexPath) {
        print(indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 90
        }
        else if section == 2{
            return 205
        }
        else if section == 3{
            let sectionItem = FoodSection.sectionArray.count
            let foodItem = FoodSection.sectionArray[section].sectionItems.count
            return (CGFloat(sectionItem) * CGFloat(foodItem)) * 200
        }
        return CGFloat()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return UIView()
        }
        else if section == 1{
            let view = tableView.dequeueReusableCell(withIdentifier: FoodTitleCell.reusableId) as! FoodTitleCell
            return view
        }
        else if section == 2{
            let view = tableView.dequeueReusableCell(withIdentifier: DeliverDetailsCell.reusableId) as! DeliverDetailsCell
            return view
        }
        else if section == 3{
//            let view = tableView.dequeueReusableCell(withIdentifier: FoodSectionTableViewCell.reusableId) as! FoodSectionTableViewCell
            let view = FoodSectionTableView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 15
            return view
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableView.tableHeaderView as! StrechyHeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
        
        let y = scrollView.contentOffset.y
        let v = y/210
        let value = Double(round(100*v)/100)
        
        if value >= 0.26{
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.customNavBar.backgroundColor = .white
                self.customNavBar.arrowButton.tintColor = .black
                self.customNavBar.searchButton.tintColor = .black
                self.customNavBar.saveButton.tintColor = .black
                self.customNavBar.titleLabel.isHidden = false
                self.customNavBar.titleLabel.alpha = 1
                self.customNavBar.collectionView.isHidden = false
                self.customNavBar.collectionView.alpha = 1
            }, completion: nil)
            UIView.animate(withDuration: 0.2) {
                self.customNavBar.collectionView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.customNavBar.titleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.customNavBar.backgroundColor = .clear
                self.customNavBar.arrowButton.tintColor = .white
                self.customNavBar.searchButton.tintColor = .white
                self.customNavBar.saveButton.tintColor = .white
                self.customNavBar.titleLabel.isHidden = true
                self.customNavBar.titleLabel.alpha = 0
                self.customNavBar.collectionView.isHidden = true
                self.customNavBar.collectionView.alpha = 0
            }, completion: nil)
            UIView.animate(withDuration: 0.2) {
                self.customNavBar.collectionView.transform = CGAffineTransform(translationX: 0, y: -20)
                self.customNavBar.titleLabel.transform = CGAffineTransform(translationX: 0, y: -20)
            }
        }
    }
}
