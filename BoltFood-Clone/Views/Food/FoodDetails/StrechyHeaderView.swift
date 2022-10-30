//
//  FoodCustomNavBar.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 15/10/2022.
//

import UIKit

class StrechyHeaderView: UIView {
 
    var imageViewHeight = NSLayoutConstraint()
    var imageViewBottom = NSLayoutConstraint()
    var containerViewHeight = NSLayoutConstraint()
    
    
    let gradient = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradient.frame = gradientView.bounds
    }
    func setupGradient(){
        gradient.colors = [ UIColor.red.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradientView.layer.insertSublayer(gradient, at: 0) 
    }
    // MARK: Properties -
    let containerView: UIView = {
        let v = UIView()
        v.isUserInteractionEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let backgroundImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "chicken")
        iv.layer.cornerRadius = 20
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let gradientView: UIView = {
        let v = UIView(frame: .zero)
        v.isUserInteractionEnabled = true
        v.backgroundColor = .black.withAlphaComponent(0.06)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    func setupViews(){
        addSubview(containerView)
        containerView.addSubview(backgroundImage)
        backgroundImage.addSubview(gradientView)
        gradientView.bringSubviewToFront(backgroundImage)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            self.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            containerView.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: gradientView.widthAnchor),

            gradientView.topAnchor.constraint(equalTo: backgroundImage.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor),

        ])

        containerView.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        // ImageView Constraints
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = backgroundImage.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight = gradientView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
