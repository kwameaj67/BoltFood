//
//  PromoCodeVC.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 18/09/2022.
//

import UIKit
import NotificationCenter

class PromoCodeVC: UIViewController, UITextFieldDelegate {
    
    private var isShowingKeyboard:Bool = false
    private var bottomButtonConstraint = NSLayoutConstraint()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Promo codes"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupNavigationBar()
        promoCodeInput.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(gesture:))))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.layer.zPosition = 0
    }
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = "Promo codes"
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.font: UIFont(name:font.semi_bold.rawValue, size: 16.0)!,NSAttributedString.Key.foregroundColor: color.black]
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
    let promoCodeInput: UITextField = {
        let input =  BFTextField(frame: .zero)
        input.placeholder = "Promo code"
        input.title = "Promo code"
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    let applyBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Apply", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.semi_bold.rawValue, size: 17)
        btn.backgroundColor = color.green
        btn.layer.cornerRadius = 54/2
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    func textFieldDidBeginEditing(_ textField: UITextField) {
        promoCodeInput.addBorders()
        isShowingKeyboard = true
    }
    @objc func hideKeyboard(gesture : UITapGestureRecognizer){
        view.endEditing(true)
//        promoCodeInput.resignFirstResponder()
        promoCodeInput.removeBorders()
    }
    func setupViews(){
        view.addSubview(promoCodeInput)
        view.addSubview(applyBtn)
    }
    func setupConstraints(){
        bottomButtonConstraint =  applyBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        bottomButtonConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            promoCodeInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            promoCodeInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            promoCodeInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promoCodeInput.heightAnchor.constraint(equalToConstant: 60),
            
            applyBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyBtn.heightAnchor.constraint(equalToConstant: 54),
       
        ])
    }
  
    @objc private func keyboardWillShow(notification: Notification){
        if let keyboardRectangle = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if isShowingKeyboard{
                self.bottomButtonConstraint.constant = -(keyboardRectangle.height) + 20
            }
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }

    }
    @objc private func keyboardWillHide(notification: Notification){
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if isShowingKeyboard{
                self.bottomButtonConstraint.constant = -20
            }
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
