//
//  SwipingController.swift
//  Plinder
//
//  Created by Patricio Perez on 12/01/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let containerView = UIView()
    let imageView = UIImageView()
    let labelTitle = UILabel()
    let labelSubtitle = UILabel()
    
    let buttonLogin = UIButton()
    let buttonSignup = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(labelSubtitle)
        containerView.addSubview(buttonLogin)
        containerView.addSubview(buttonSignup)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        let topConstraintContainer = containerView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let bottomConstraintContainer = containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let trailingConstraintContainer = containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let leadingConstraintContainer = containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        NSLayoutConstraint.activate([topConstraintContainer, bottomConstraintContainer, trailingConstraintContainer, leadingConstraintContainer])
        
        //imageView.image = UIImage(named: "logo_plinder_pre.png")
        imageView.contentMode = .scaleAspectFit
        
        let topContraintImage = imageView.topAnchor.constraint(equalTo: containerView.topAnchor)
        let bottomContraintImage = imageView.bottomAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -50)
        let leadingConstraintImage = imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30)
        let trailingConstraintImage = imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30)
        NSLayoutConstraint.activate([topContraintImage, bottomContraintImage, leadingConstraintImage, trailingConstraintImage])
        
        //label.text = "Hello! Welcome to Plinder\n The best aplication the Films"
        labelTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 0
        labelTitle.textColor = .systemRed
        labelTitle.lineBreakMode = .byTruncatingTail
        
        let topConstraintLabel = labelTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30)
        let leadingConstraintLabel = labelTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10)
        let trailingConstraintLabel = labelTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        //let heightConstraintLabel = labelTitle.heightAnchor.constraint(equalToConstant: 35)
        NSLayoutConstraint.activate([topConstraintLabel, leadingConstraintLabel, trailingConstraintLabel])
        
        labelSubtitle.font = UIFont(name: "Avenir", size: 16)
        labelSubtitle.textAlignment = .center
        labelSubtitle.textColor = .gray
        labelSubtitle.numberOfLines = 0
        labelSubtitle.lineBreakMode = .byTruncatingTail
        labelSubtitle.isHidden = false
        
        let topConstraintSubtitle = labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 30)
        //let bottomConstraintSubtitle = labelSubtitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -35)
        let leadingConstraintSubtitle = labelSubtitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        let trailingConstraintSubtitle = labelSubtitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        NSLayoutConstraint.activate([topConstraintSubtitle, trailingConstraintSubtitle, leadingConstraintSubtitle])
        
        buttonLogin.backgroundColor = .systemRed
        buttonLogin.setTitle("Log In", for: .normal)
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.layer.borderColor = UIColor.systemRed.cgColor
        buttonLogin.layer.cornerRadius = 8.0
        buttonLogin.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonLogin.layer.shadowOpacity = 2.5
        buttonLogin.layer.shadowColor = UIColor.lightGray.cgColor
        buttonLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        buttonLogin.isHidden = true
        
        let topConstraintLogin = buttonLogin.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 55)
        let leadingConstraintLogin = buttonLogin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30)
        let trailingConstraintLogin = buttonLogin.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30)
        let heightConstraintLogin = buttonLogin.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([topConstraintLogin, leadingConstraintLogin, trailingConstraintLogin, heightConstraintLogin])
        
        buttonSignup.backgroundColor = .clear
        buttonSignup.setTitle("You do not have an account? Sign up", for: .normal)
        buttonSignup.setTitleColor(.systemRed, for: .normal)
        //buttonSignup.layer.borderColor = UIColor.clear.cgColor
        //buttonSignup.layer.cornerRadius = 8.0
        //buttonSignup.layer.shadowOffset = CGSize(width: 0, height: 0)
        //buttonSignup.layer.shadowOpacity = 8.0
        //buttonSignup.layer.shadowColor = UIColor.darkGray.cgColor
        buttonSignup.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttonSignup.isHidden = true
        
        let topConstraintSignUp = buttonSignup.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 35)
        let leadingConstraintSignUp = buttonSignup.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30)
        let trailingConstraintSignUp = buttonSignup.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30)
        let heightConstraintSignUp = buttonSignup.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([topConstraintSignUp, trailingConstraintSignUp, leadingConstraintSignUp, heightConstraintSignUp])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
