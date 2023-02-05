//
//  CategoryVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import UIKit

class SearchVC: UIViewController {
    var categoryList = MealCategory.mealCategories {
        didSet{
            self.categoryTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    lazy var searchHeaderView: SearchHeaderView = {
        let hv = SearchHeaderView()
        hv.isUserInteractionEnabled = true
        hv.searchContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapSearchView)))
        hv.filterButton.addTarget(self, action: #selector(didTapFilterButton), for: .primaryActionTriggered)
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    lazy var overlaySearchHeaderView: OverlaySearchHeaderView = {
        let hv = OverlaySearchHeaderView()
        hv.isHidden = true
        hv.alpha = 0
        hv.transform = CGAffineTransform(translationX: 0, y: -100)
        hv.cancelButton.addTarget(self, action: #selector(didTapCancelSearchView), for: .touchUpInside)
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
   
    lazy var categoryTableView: UITableView = {
        let list = UITableView(frame: .zero, style: .grouped)
        list.register(MealCategoryCell.self, forCellReuseIdentifier: MealCategoryCell.reuseableId)
        list.register(MealCategoryHeader.self, forHeaderFooterViewReuseIdentifier: MealCategoryHeader.reuseableId)
        list.delegate = self
        list.dataSource = self
        list.translatesAutoresizingMaskIntoConstraints = false
        list.showsVerticalScrollIndicator = false
        list.separatorColor = UIColor.clear
        list.backgroundColor = .white
        return list
    }()
    
    @objc func didTapSearchView(){
        UIView.animate(withDuration: 0.2) {
            self.overlaySearchHeaderView.isHidden = false
            self.overlaySearchHeaderView.alpha = 1
            self.overlaySearchHeaderView.transform = .identity
        }
        overlaySearchHeaderView.searchTextField.becomeFirstResponder()
    }
    
    @objc func didTapCancelSearchView(){
        hideOverlayViewAnimation()
    }
    
    @objc func didTapFilterButton(){
        print("filter button was tapped")
    }
   
    func setupViews(){
        [searchHeaderView,overlaySearchHeaderView,categoryTableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        overlaySearchHeaderView.bringSubviewToFront(searchHeaderView)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            searchHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchHeaderView.heightAnchor.constraint(equalToConstant: 80.0),
            
            overlaySearchHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            overlaySearchHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlaySearchHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlaySearchHeaderView.heightAnchor.constraint(equalToConstant: 125.0),
            
            categoryTableView.topAnchor.constraint(equalTo: searchHeaderView.bottomAnchor, constant: 10),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealCategoryCell.reuseableId, for: indexPath) as! MealCategoryCell
        let item = categoryList[indexPath.row]
        cell.setup(for: item)
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .default
        
        let bgView = UIView(frame: cell.bounds)
        bgView.backgroundColor = .white
        cell.selectedBackgroundView = bgView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! MealCategoryCell
        cell.categoryLabel.alpha = 0.4
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! MealCategoryCell
        cell.categoryLabel.alpha = 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: MealCategoryHeader.reuseableId) as! MealCategoryHeader
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
   // MARK: - scrollViewDidScroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if (y > 15.0){
            searchHeaderView.addBottomShadows()
        }else{
            searchHeaderView.removeBottomShadows()
        }
        
        if (y > 150.0){
            hideOverlayViewAnimation()
        }
    }
    
   
}

extension SearchVC {
    // MARK: hideOverlayViewAnimation -
    func hideOverlayViewAnimation(){
        overlaySearchHeaderView.searchTextField.resignFirstResponder()
        UIView.animate(withDuration: 0.4) {
            self.overlaySearchHeaderView.transform = CGAffineTransform(translationX: 0, y: -200)
        } completion: { _ in
            self.overlaySearchHeaderView.isHidden = true
            self.overlaySearchHeaderView.alpha = 0
        }
    }
}
