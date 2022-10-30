//
//  DeliverDetailsCell.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 15/10/2022.
//

import UIKit

class DeliverDetailsCell: UITableViewCell {
   
    static let reusableId = "DeliverDetailsCell"
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DeliverDetailsCell.reusableId)
        setupViews()
        setupContraints()
        layer.cornerRadius = 20
        backgroundColor = .white
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 10))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.register(DeliveryInfoCell.self, forCellReuseIdentifier: DeliveryInfoCell.reuseableId)
        tv.register(ContactDetailCell.self, forCellReuseIdentifier: ContactDetailCell.reuseableId)
        tv.register(DiscountCell.self, forCellReuseIdentifier: DiscountCell.reuseableId)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorColor = .clear
        tv.separatorStyle = .none
        tv.alwaysBounceVertical = false
        tv.bounces = false
        tv.isScrollEnabled = false
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    func setupViews(){
        contentView.addSubview(tableView)
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
   
}

extension DeliverDetailsCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryInfoCell.reuseableId, for: indexPath) as! DeliveryInfoCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactDetailCell.reuseableId, for: indexPath) as! ContactDetailCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscountCell.reuseableId, for: indexPath) as! DiscountCell
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 60
        }
        else if indexPath.row == 1{
            return 60
        }
        else if indexPath.row == 2{
            return 60
        }
        return CGFloat()
    }
}


