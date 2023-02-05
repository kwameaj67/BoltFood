//
//  ProfileVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 08/09/2022.
//

import UIKit


class ProfileVC: UIViewController, UITextFieldDelegate {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        setupNavigationBar()
        setupViews()
        setupConstraints()
        [firstnameInput,lastnameInput,emailInput].forEach {
            $0.delegate = self
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    // hide tabBar
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
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = "Profile"
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
    // MARK: Properties -
    let firstnameInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "First name"
        input.title = "First name"
        input.text = "Kwame"
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let lastnameInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Last name"
        input.title = "Last name"
        input.text = "Boateng"
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let emailInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "E-mail"
        input.title = "E-mail"
        input.text = "kwameagyenimboateng64@gmail.com"
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let phoneInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Phone number"
        input.title = "Phone number"
        input.text = "+233208956935"
        input.alpha = 0.8
        input.disabledColor = .systemGray2
        input.isEnabled = false
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let inputStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10.0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let logoutBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Log out", for: .normal)
        btn.setTitleColor(color.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 16)
        btn.backgroundColor = .systemGray6
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 54/2
        return btn
    }()
    let deleteBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Delete account", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 16)
        btn.backgroundColor = color.red
        btn.layer.cornerRadius = 54/2
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc func hideKeyboard(){
        [firstnameInput,lastnameInput,emailInput].forEach { item in
            item.resignFirstResponder()
            item.removeBorders()
        }
    }
    func setupViews(){
        [inputStack,logoutBtn,deleteBtn].forEach {
            view.addSubview($0)
        }
        [firstnameInput,lastnameInput,emailInput,phoneInput].forEach {
            inputStack.addArrangedSubview($0)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if firstnameInput.isFirstResponder{
            firstnameInput.addBorders()
            [emailInput,lastnameInput].forEach {
                $0.removeBorders()
            }
        }
        else if lastnameInput.isFirstResponder {
            lastnameInput.addBorders()
            [firstnameInput,emailInput].forEach {
                $0.removeBorders()
            }
        }
        else if emailInput.isFirstResponder{
            emailInput.addBorders()
            [firstnameInput,lastnameInput].forEach {
                $0.removeBorders()
            }
        }
    }
    func removeResponder(input: UITextField){
        if firstnameInput.isFirstResponder{
            removeResponder(input: firstnameInput)
            input.resignFirstResponder()
        }
        else if lastnameInput.isFirstResponder{
            removeResponder(input: lastnameInput)
            input.resignFirstResponder()
        }
        else if emailInput.isFirstResponder{
            removeResponder(input: emailInput)
            input.resignFirstResponder()
        }
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            inputStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            firstnameInput.heightAnchor.constraint(equalToConstant: 60),
            lastnameInput.heightAnchor.constraint(equalToConstant: 60),
            emailInput.heightAnchor.constraint(equalToConstant: 60),
            phoneInput.heightAnchor.constraint(equalToConstant: 60),
            
            deleteBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            deleteBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            deleteBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            deleteBtn.heightAnchor.constraint(equalToConstant: 56),
            
            logoutBtn.bottomAnchor.constraint(equalTo: deleteBtn.topAnchor, constant: -20),
            logoutBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logoutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            logoutBtn.heightAnchor.constraint(equalToConstant: 56),
        ])
    }

}

extension ProfileVC {
    
}
