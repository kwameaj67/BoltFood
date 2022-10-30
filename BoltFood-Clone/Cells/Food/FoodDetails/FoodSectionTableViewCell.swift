//
//  FoodOptionsCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/10/2022.
//

import UIKit

class FoodSectionTableView: UIView {
    var sections = FoodSection.sectionArray
    static let reusableId = "FoodSectionTableViewCell"
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: FoodSectionTableViewCell.reusableId)
//        setupViews()
//        setupContraints()
//        layer.cornerRadius = 20
//        backgroundColor = .white
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        layer.cornerRadius = 20
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    lazy var foodTableView: UITableView = {
        let tv = UITableView(frame: .zero,style: .grouped)
        tv.register(FoodOptionCell.self, forCellReuseIdentifier: FoodOptionCell.reuseableId)
        tv.register(FoodOptionHeaderView.self, forHeaderFooterViewReuseIdentifier: FoodOptionHeaderView.reusableId)
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.separatorColor = .clear
        tv.separatorStyle = .none
        tv.alwaysBounceVertical = false
        tv.bounces = false
        tv.tableHeaderView = UIView()
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    func setupViews(){
        addSubview(foodTableView)
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            foodTableView.topAnchor.constraint(equalTo: topAnchor),
            foodTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
   
}

extension FoodSectionTableView: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].sectionItems.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FoodOptionHeaderView.reusableId) as! FoodOptionHeaderView
        headerView.titleLabel.text = sections[section].sectionName
        let bgView  = UIView(frame: headerView.bounds)
        bgView.backgroundColor = .white
        headerView.backgroundView = bgView
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodOptionCell.reuseableId, for: indexPath) as! FoodOptionCell
        let item = sections[indexPath.section].sectionItems[indexPath.row]
        cell.data = item
        cell.selectionStyle = .none
        return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].sectionItems[indexPath.row]
        print(item.title)
    }
    
}
