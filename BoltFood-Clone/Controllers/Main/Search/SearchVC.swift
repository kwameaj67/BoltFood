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
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(MealCategoryCell.self, forCellReuseIdentifier: MealCategoryCell.reuseableId)
        categoryTableView.register(MealCategoryHeader.self, forHeaderFooterViewReuseIdentifier: MealCategoryHeader.reuseableId)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    let searchHeaderView = SearchHeaderVIew()
    
    func setupViews(){
        [searchHeaderView,categoryTableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    let categoryTableView: UITableView = {
        let list = UITableView(frame: .zero, style: .grouped)
        list.translatesAutoresizingMaskIntoConstraints = false
        list.showsVerticalScrollIndicator = false
        list.separatorColor = UIColor.clear
        list.backgroundColor = .white
        return list
    }()
    
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
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: MealCategoryHeader.reuseableId) as! MealCategoryHeader
        view.headingLabel.text = "Popular categories"
        view.contentView.backgroundColor = .white
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            searchHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchHeaderView.heightAnchor.constraint(equalToConstant: 85.0),
            
            categoryTableView.topAnchor.constraint(equalTo: searchHeaderView.bottomAnchor, constant: 10),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
//        print(y)
        if (y > 15.0){
            searchHeaderView.addBottomShadows()
        }else{
            searchHeaderView.removeBottomShadows()
        }
    }
    
   
}
