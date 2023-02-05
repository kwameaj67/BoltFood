//
//  AboutVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 08/09/2022.
//

import UIKit

class AboutVC: UIViewController {
    
    private var aboutData = ["Rate the app", "Like us on Facebook", "Jobs", "Legal", "Licences"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "About"
        setupNavigationBar()
        setupViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.reusableId)
        tableView.register(AboutHeaderView.self, forHeaderFooterViewReuseIdentifier: AboutHeaderView.reuseableId)
        navigationController?.navigationBar.isHidden = false
    }
    // hide tabBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    // MARK: Properties -
    let tableView: UITableView = {
        let list = UITableView(frame: .zero,style: .grouped)
        list.translatesAutoresizingMaskIntoConstraints = false
        list.showsVerticalScrollIndicator = false
        list.separatorColor  = color.grey.withAlphaComponent(0.4)
        list.backgroundColor = .white
        list.tableFooterView = UIView()
        list.separatorStyle = .none
        list.separatorColor = .clear
        return list
    }()
    func setupViews(){
        view.addSubview(tableView)
    }
   
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = "About"
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.font: UIFont(name:font.semi_bold.rawValue, size: 16.0)!,NSAttributedString.Key.foregroundColor: color.black]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        
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

}
extension AboutVC: UITableViewDelegate, UITableViewDataSource {
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutData.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: AboutHeaderView.reuseableId) as! AboutHeaderView
        view.contentView.backgroundColor = .white
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.reusableId, for: indexPath) as! AboutCell
        cell.label.text = aboutData[indexPath.row]
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    
}
