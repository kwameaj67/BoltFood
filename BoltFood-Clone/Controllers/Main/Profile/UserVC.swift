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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            navigationController?.pushViewController(PaymentVC(), animated: true)
        }
        if indexPath.row == 1{
            navigationController?.pushViewController(PromoCodeVC(), animated: true)
        }
        if indexPath.row == 2{
            navigationController?.pushViewController(ProfileVC(), animated: true)
        }
        if indexPath.row == 4{
            navigationController?.pushViewController(AboutVC(), animated: true)
        }
    }
    
    func setupViews(){
        view.addSubview(optionTableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            optionTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 70),
            optionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            optionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            optionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
