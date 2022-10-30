//
//  ViewController.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import UIKit

class RegisterVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        phoneField.delegate = self
        navigationController?.navigationBar.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
//    override func viewDidLayoutSubviews() {
//        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//    }
    
    let skipButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(color.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: font.light.rawValue, size: 14)
        btn.backgroundColor = .none
        btn.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let scrollView : UIScrollView = {
        var sv = UIScrollView(frame: .zero)
        sv.showsVerticalScrollIndicator = false
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
     let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let logo : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(named: "Bolt_Food_logo")?.withRenderingMode(.alwaysOriginal)
        iv.image = img
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let button: UIButton = {
        var b =  BFButton(frame: .zero)
        b.setTitle("Continue", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = color.green
        return b
    }()
    let termsLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.grey
        lb.alpha = 0.8
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.scaleFont()
        return lb
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 10.0
        return sv
    }()
    let phoneField: UITextField = {
        var tf = TextField(frame: .zero)
        tf.placeholder = "Phone number"
        tf.borderStyle = .none
        tf.textColor = color.black
        tf.font = UIFont(name:font.light.rawValue, size: 15)
        tf.backgroundColor = color.background
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 10.0
        tf.keyboardType = .numberPad
        return tf
    }()
    let codeContainer: UIView = {
       let v = UIView()
       v.backgroundColor = color.background
       v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10.0
       return v
   }()
    let codeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "+233"
        lb.textColor = color.black
        lb.font = UIFont(name:font.light.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.scaleFont()
        return lb
    }()
    let arrow : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(systemName: "chevron.down")
        iv.image = img
        iv.tintColor = .systemGray2
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.frame = CGRect(x: 0, y: 0, width: 2.0, height: 2.0)
        return iv
    }()
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneField.layer.borderWidth = 2
        phoneField.layer.borderColor = color.green.cgColor
        phoneField.layer.backgroundColor = UIColor.white.cgColor
    }
    @objc func hideKeyboard(){
        if phoneField.isFirstResponder {
            phoneField.resignFirstResponder()
            phoneField.layer.borderWidth = 0
            phoneField.layer.borderColor = .none
            phoneField.layer.backgroundColor = color.background.cgColor
        }
    }
    @objc func handleTap(){
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(true, forKey: "isLoggedIn")
        userDefaults.synchronize()
        
        let vc = CustomTabBarVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}


extension RegisterVC {
    func setupViews(){
        
        view.addSubview(skipButton)
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(container)
        [logo,termsLabel,button,stackView].forEach { item in
            container.addSubview(item)
        }
        [codeLabel,arrow].forEach { item in
            codeContainer.addSubview(item)
        }
        [codeContainer,phoneField].forEach { item in
            stackView.addArrangedSubview(item)
        }

        termsLabel.attributedText = setAttributedTitle("If you sign up, ", "Terms & Conditions and Privacy policy"," apply.")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            scrollView.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 15),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            container.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            logo.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            logo.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 60.0),
            logo.widthAnchor.constraint(equalToConstant: 200),
            
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -30),
            
            codeContainer.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            codeContainer.widthAnchor.constraint(equalTo: phoneField.widthAnchor, multiplier: 0.45),
            codeContainer.heightAnchor.constraint(equalToConstant: 56.0),
            
            phoneField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            phoneField.heightAnchor.constraint(equalToConstant: 56.0),
            
            codeLabel.leadingAnchor.constraint(equalTo: codeContainer.leadingAnchor, constant: 10),
            codeLabel.centerYAnchor.constraint(equalTo: codeContainer.centerYAnchor),
            
            arrow.trailingAnchor.constraint(equalTo: codeContainer.trailingAnchor, constant: -10),
            arrow.centerYAnchor.constraint(equalTo: codeContainer.centerYAnchor),
            
            termsLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -14),
            termsLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),

            button.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
            button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    func setAttributedTitle(_ title: String,_ subTitle: String,_ subTitleOther: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont(name: font.light.rawValue, size: 11)!]))
        attributedText.append(NSAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font:UIFont(name: font.light.rawValue, size: 11)!, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
        attributedText.append(NSAttributedString(string: subTitleOther, attributes: [NSAttributedString.Key.font: UIFont(name: font.light.rawValue, size: 11)!]))
        return attributedText
    }
    
    private class TextField: UITextField{
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 20, dy: 0)
        }
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 20, dy: 0)
        }
    }
   
}
