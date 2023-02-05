//
//  PaymentVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/09/2022.
//

import UIKit

class PaymentVC: UIViewController {
    
    var sections = Section.sectionArray
    var selectedIndexes = [[IndexPath.init(row: 0, section: 1)], [IndexPath.init(row: 0, section: 1)]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Payment"
        view.backgroundColor = .white
        setupNavigationBar()
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Payment"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name:font.semi_bold.rawValue, size: 16.0)!,NSAttributedString.Key.foregroundColor: color.black]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name:font.semi_bold.rawValue, size: 24.0)!,NSAttributedString.Key.foregroundColor: color.black]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        
        let backButton = UIButton(type: .system)
        let image = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(weight: .semibold))
        backButton.setImage(image, for: .normal)
        backButton.tintColor = .black
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.backBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        let leftButton = UIBarButtonItem()
        leftButton.customView = backButton
        navigationItem.setLeftBarButton(leftButton, animated: true)
    }
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Properties -
    lazy var paymentTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(BalanceHeaderView.self, forHeaderFooterViewReuseIdentifier: BalanceHeaderView.reuseableId)
        tv.register(PaymentMethodHeaderView.self, forHeaderFooterViewReuseIdentifier: PaymentMethodHeaderView.reuseableId)
        tv.register(PaymentOptionCell.self, forCellReuseIdentifier: PaymentOptionCell.reuseableId)
        tv.delegate = self
        tv.dataSource = self
        tv.allowsSelection = true
        tv.backgroundColor = .clear
        tv.allowsMultipleSelection = false
        tv.showsVerticalScrollIndicator = false
        tv.separatorColor = .clear
        tv.tableHeaderView = UIView()
        tv.tableFooterView = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupViews(){
        view.addSubview(paymentTableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            paymentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paymentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            paymentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            paymentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension PaymentVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].sectionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentOptionCell.reuseableId, for: indexPath) as! PaymentOptionCell
        let item = sections[indexPath.section].sectionItems[indexPath.row]
        cell.setup(for: item)
        let bgView = UIView(frame: cell.bounds)
        bgView.backgroundColor = .white.withAlphaComponent(0.8)
        cell.selectedBackgroundView = bgView
        cell.backgroundView = bgView
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .gray
        cell.isSelected = item.selected
        
        if indexPath.section == 0 && indexPath.row == 0 {
            hideViews(cell)
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            hideViews(cell)
            hideBorder(cell)
        }
      
        if indexPath.section == 1 && indexPath.row == 2 {
            hideViews(cell)
            cell.arrow.isHidden = false
            cell.arrow.alpha = 1
            hideBorder(cell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: BalanceHeaderView.reuseableId) as! BalanceHeaderView
            let bgView = UIView(frame: headerView.bounds)
            bgView.backgroundColor = .white
            headerView.backgroundView = bgView
            return headerView
        }
        else if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PaymentMethodHeaderView.reuseableId) as! PaymentMethodHeaderView
            let bgView = UIView(frame: headerView.bounds)
            bgView.backgroundColor = .white
            headerView.backgroundView = bgView
            return headerView
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return CGFloat(90)
        }
        if section == 1{
            return CGFloat(60)
        }
        return CGFloat()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = paymentTableView.cellForRow(at: IndexPath(item: indexPath.row, section: indexPath.section)) as! PaymentOptionCell
        var item = sections[indexPath.section].sectionItems[indexPath.row]
        if (indexPath.section == 1 && indexPath.row == 0) || indexPath.section == 1 && indexPath.row == 1 {
                if !item.selected {
                    item.selected = true
                    cell.circleImage.image = UIImage(systemName: "record.circle.fill")
                    cell.circleImage.tintColor = color.green
                } else {
                    item.selected = false
                    sections[indexPath.section].sectionItems[indexPath.row].selected.toggle()
                    cell.circleImage.image = UIImage(systemName: "circle")
                    cell.circleImage.tintColor = color.grey.withAlphaComponent(0.4)
                }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = paymentTableView.cellForRow(at: IndexPath(item: indexPath.row, section: indexPath.section)) as! PaymentOptionCell
        if (indexPath.section == 1 && indexPath.row == 0) || indexPath.section == 1 && indexPath.row == 1 {
            cell.circleImage.image = UIImage(systemName: "circle")
            cell.circleImage.tintColor = color.grey.withAlphaComponent(0.4)
        }
    }
    
    func hideViews(_ cell: PaymentOptionCell){
        cell.circleImage.isHidden = true
        cell.circleImage.alpha = 0
    }
    func hideBorder(_ cell: PaymentOptionCell){
        cell.border.isHidden = true
        cell.border.alpha = 0
    }
}
