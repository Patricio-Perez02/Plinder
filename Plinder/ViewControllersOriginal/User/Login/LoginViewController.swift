//
//  LoginViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 17/05/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import SketchKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let labelLogin = UILabel()
    let tFieldEmail = UITextField()
    let lineEmail = UIView()
    let tFieldPassword = UITextField()
    let linePassword = UIView()
    let labelError = UILabel()
    let buttonReady = UIButton()
    let labelOr = UILabel()
    
    let buttonPassword = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    //MARK: ConfigureUI
    
    func configureUI() {
        
        view.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        view.addSubview(labelLogin)
        view.addSubview(tFieldEmail)
        view.addSubview(lineEmail)
        view.addSubview(tFieldPassword)
        view.addSubview(linePassword)
        view.addSubview(labelError)
        view.addSubview(buttonReady)
        view.addSubview(labelOr)
        view.addSubview(buttonPassword)
        
        labelLogin.translatesAutoresizingMaskIntoConstraints = false
        lineEmail.translatesAutoresizingMaskIntoConstraints = false
        tFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        tFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        linePassword.translatesAutoresizingMaskIntoConstraints = false
        labelError.translatesAutoresizingMaskIntoConstraints = false
        buttonReady.translatesAutoresizingMaskIntoConstraints = false
        labelOr.translatesAutoresizingMaskIntoConstraints = false
        buttonPassword.translatesAutoresizingMaskIntoConstraints = false
        
        labelLogin.text = "Log In"
        labelLogin.font = UIFont.boldSystemFont(ofSize: 50)
        labelLogin.textAlignment = .left
        labelLogin.textColor = .white
        labelLogin.numberOfLines = 0
        labelLogin.lineBreakMode = .byTruncatingTail
        
        labelLogin.layout.applyConstraint { label in
            label.topAnchor(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
            label.leadingAnchor(equalTo: view.leadingAnchor, constant: 20)
            label.trailingAnchor(equalTo:  view.trailingAnchor, constant: -20)
        }
        
        tFieldEmail.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tFieldEmail.textColor = .white
        tFieldEmail.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tFieldEmail.tintColor = .systemRed
        
        tFieldEmail.layout.applyConstraint { tField in
            tField.topAnchor(equalTo: labelLogin.bottomAnchor, constant: 30)
            tField.leadingAnchor(equalTo: view.leadingAnchor, constant: 20)
            tField.trailingAnchor(equalTo:  view.trailingAnchor, constant: -20)
            tField.heightAnchor(equalToConstant: 30)
        }
        
        lineEmail.backgroundColor = .white
        
        lineEmail.layout.applyConstraint { line in
            line.topAnchor(equalTo: tFieldEmail.bottomAnchor, constant: 0.2)
            line.leadingAnchor(equalTo: tFieldEmail.leadingAnchor)
            line.trailingAnchor(equalTo:  tFieldEmail.trailingAnchor)
            line.heightAnchor(equalToConstant: 1.5)
        }
        
        tFieldPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tFieldPassword.textColor = .white
        tFieldPassword.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tFieldPassword.tintColor = .systemRed
        tFieldPassword.isSecureTextEntry = true
        
        tFieldPassword.layout.applyConstraint { tField in
            tField.topAnchor(equalTo: lineEmail.bottomAnchor, constant: 30)
            tField.leadingAnchor(equalTo: view.leadingAnchor, constant: 20)
            tField.trailingAnchor(equalTo:  buttonPassword.leadingAnchor, constant: -5)
            tField.heightAnchor(equalToConstant: 30)
        }
        
        buttonPassword.setImage(UIImage(named: "see_text"), for: .normal)
        buttonPassword.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        buttonPassword.isSelected = false
        buttonPassword.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
        buttonPassword.layout.applyConstraint { button in
            button.topAnchor(equalTo: lineEmail.bottomAnchor, constant: 30)
            button.trailingAnchor(equalTo: view.trailingAnchor, constant: -20)
            button.widthAnchor(equalToConstant: 30)
            button.heightAnchor(equalToConstant: 30)
        }
        
        linePassword.backgroundColor = .white
        
        linePassword.layout.applyConstraint { line in
            line.topAnchor(equalTo: tFieldPassword.bottomAnchor, constant: 0.2)
            line.leadingAnchor(equalTo: tFieldPassword.leadingAnchor)
            line.trailingAnchor(equalTo:  buttonPassword.trailingAnchor)
            line.heightAnchor(equalToConstant: 1.5)
        }
        
        labelError.isHidden = true
        labelError.text = "* Error en la contraseña"
        labelError.numberOfLines = 0
        labelError.textColor = .systemRed
        labelError.textAlignment = .center
        labelError.font = UIFont.boldSystemFont(ofSize: 13)
        
        labelError.layout.applyConstraint { label in
            label.topAnchor(equalTo: linePassword.bottomAnchor, constant: 10)
            label.leadingAnchor(equalTo: linePassword.leadingAnchor)
            label.trailingAnchor(equalTo: linePassword.trailingAnchor)
        }
        
        buttonReady.setTitle("Log in", for: .normal)
        buttonReady.setTitleColor(.white, for: .normal)
        buttonReady.backgroundColor = .systemRed
        buttonReady.layer.cornerRadius = 17.5
        buttonReady.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonReady.layer.shadowColor = UIColor.lightGray.cgColor
        buttonReady.layer.shadowOffset = CGSize(width: 0, height: -1)
        buttonReady.layer.shadowOpacity = 0.5
        buttonReady.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        
        buttonReady.layout.applyConstraint { button in
            button.topAnchor(equalTo: labelError.bottomAnchor, constant: 10)
            button.leadingAnchor(equalTo: view.leadingAnchor, constant: 60)
            button.trailingAnchor(equalTo:  view.trailingAnchor, constant: -60)
            button.heightAnchor(equalToConstant: 35)
        }
        
        labelOr.text = " -----OR----- "
        labelOr.textAlignment = .center
        labelOr.textColor = .gray
        labelOr.font = UIFont.boldSystemFont(ofSize: 12)
        
        labelOr.layout.applyConstraint { label in
            labelOr.topAnchor(equalTo: buttonReady.bottomAnchor, constant: 20)
            labelOr.leadingAnchor(equalTo: view.leadingAnchor, constant: 20)
            labelOr.trailingAnchor(equalTo:  view.trailingAnchor, constant: -20)
        }
    }
    
    @objc func actionButton() {
        
        if buttonPassword.isSelected == false {
            buttonPassword.setImage(UIImage(named: "hide_text"), for: .normal)
            buttonPassword.isSelected = true
            tFieldPassword.isSecureTextEntry = false
        }
        /*if buttonPassword.isSelected == true {
            buttonPassword.isSelected = false
            buttonPassword.setImage(UIImage(named: "see_text"), for: .normal)
            tFieldPassword.isSecureTextEntry = true
        }*/
        
    }
    
    @objc func loginUser() {
        if let email = tFieldEmail.text , let password = tFieldPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, erro) in
                //Chequeo si hay error en los datos
                if erro != nil{
                    self.labelError.text = erro!.localizedDescription
                    self.labelError.alpha = 1
                } else {
                    let hv = HomeViewController()
                    self.navigationController?.pushViewController(hv, animated: true)
                }
            }
        }
    }
}
