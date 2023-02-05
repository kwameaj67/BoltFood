//
//  UserVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import UIKit

class UserVC: UIViewController {

    private var options = UserOption.optionList
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
    
    lazy var optionTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(UserOptionCell.self, forCellReuseIdentifier: UserOptionCell.reuseableId)
        tv.register(UserOptionHeaderView.self, forHeaderFooterViewReuseIdentifier: UserOptionHeaderView.reuseableId)
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.separatorColor  = UIColor.clear
        tv.backgroundColor = .white
        return tv
    }()

}

extension UserVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: UserOptionHeaderView.reuseableId) as! UserOptionHeaderView
        view.usernameLabel.text = "Kwame Boateng"
        view.phoneLabel.text = "+233208956935"
        view.contentView.backgroundColor = .white
        return view
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: UserOptionCell.reuseableId, for: indexPath) as! UserOptionCell
        let item = options[indexPath.row]
        cell.setup(for: item)
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .default
        
        let bgView = UIView(frame: cell.bounds)
        bgView.backgroundColor = .white
        cell.selectedBackgroundView = bgView
        return cell
    }
   
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! UserOptionCell
        cell.label.alpha = 0.4
        cell.icon.alpha = 0.4
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! UserOptionCell
        cell.label.alpha = 1
        cell.icon.alpha = 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = options[indexPath.row]
        switch item.type{
            case .payment:
            navigationController?.pushViewController(PaymentVC(), animated: true)
        case .promocode:
            navigationController?.pushViewController(PromoCodeVC(), animated: true)
        case .profile:
            navigationController?.pushViewController(ProfileVC(), animated: true)
        case .about:
            navigationController?.pushViewController(AboutVC(), animated: true)
        case .settings:
            print("Settings")
        case .help:
            print("Help")
        }
    }
    
    func setupViews(){
        view.addSubview(optionTableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            optionTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            optionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            optionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            optionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
