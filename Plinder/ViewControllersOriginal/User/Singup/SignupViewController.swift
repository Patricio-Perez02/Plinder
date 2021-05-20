//
//  SignupViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 13/01/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseDatabase

class SignupViewController: UIViewController {

    let labelPlinder = UILabel()
    let tfieldName = UITextField()
    let lineForName = UIView()
    let tfieldLastName = UITextField()
    let lineLastName = UIView()
    let tfieldMail = UITextField()
    let lineMail = UIView()
    let tfieldPassword = UITextField()
    let linePassword = UIView()
    let labelError = UILabel()
    let buttonReady = UIButton()
    let buttonCancel = UIButton()
    
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        view.addSubview(labelPlinder)
        view.addSubview(tfieldName)
        view.addSubview(lineForName)
        view.addSubview(tfieldLastName)
        view.addSubview(lineLastName)
        view.addSubview(tfieldMail)
        view.addSubview(lineMail)
        view.addSubview(tfieldPassword)
        view.addSubview(linePassword)
        view.addSubview(labelError)
        view.addSubview(buttonReady)
        view.addSubview(buttonCancel)
        
        labelPlinder.translatesAutoresizingMaskIntoConstraints = false
        tfieldName.translatesAutoresizingMaskIntoConstraints = false
        lineForName.translatesAutoresizingMaskIntoConstraints = false
        tfieldLastName.translatesAutoresizingMaskIntoConstraints = false
        tfieldMail.translatesAutoresizingMaskIntoConstraints = false
        tfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        lineLastName.translatesAutoresizingMaskIntoConstraints = false
        lineMail.translatesAutoresizingMaskIntoConstraints = false
        linePassword.translatesAutoresizingMaskIntoConstraints = false
        labelError.translatesAutoresizingMaskIntoConstraints = false
        buttonReady.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        
        labelPlinder.text = "New\nAccount"
        labelPlinder.font = UIFont.boldSystemFont(ofSize: 50)
        labelPlinder.textAlignment = .left
        labelPlinder.textColor = .white
        labelPlinder.numberOfLines = 0
        labelPlinder.lineBreakMode = .byTruncatingTail
        
        let topConstraintPlinder = labelPlinder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
        let leadingConstraintPlinder = labelPlinder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let trailingConstraintPlinder = labelPlinder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        NSLayoutConstraint.activate([topConstraintPlinder, leadingConstraintPlinder, trailingConstraintPlinder])

        tfieldName.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tfieldName.textColor = .white
        tfieldName.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tfieldName.tintColor = .systemRed
        
        let topContraintTFName = tfieldName.topAnchor.constraint(equalTo: labelPlinder.bottomAnchor, constant: 30)
        let leadingContraintTFName = tfieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let trailingConstraintTFName = tfieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let heightConstraintTFName = tfieldName.heightAnchor.constraint(equalToConstant: 30)
        NSLayoutConstraint.activate([topContraintTFName, leadingContraintTFName, trailingConstraintTFName, heightConstraintTFName])
        
        lineForName.backgroundColor = .white
        
        let topConstraintLineName = lineForName.topAnchor.constraint(equalTo: tfieldName.bottomAnchor, constant: 0.2)
        let leadingConstraintLineName = lineForName.leadingAnchor.constraint(equalTo: tfieldName.leadingAnchor)
        let trailingConstraintLineName = lineForName.trailingAnchor.constraint(equalTo: tfieldName.trailingAnchor)
        let heightConstraintLineName = lineForName.heightAnchor.constraint(equalToConstant: 1.5)
        NSLayoutConstraint.activate([topConstraintLineName, leadingConstraintLineName, trailingConstraintLineName, heightConstraintLineName])
        
        tfieldLastName.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tfieldLastName.textColor = .white
        tfieldLastName.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tfieldLastName.tintColor = .systemRed
        
        let topConstraintTFLastName = tfieldLastName.topAnchor.constraint(equalTo: lineForName.bottomAnchor, constant: 30)
        let leadingConstraintTFLastName = tfieldLastName.leadingAnchor.constraint(equalTo: lineForName.leadingAnchor)
        let trailingConstraintTFLastName = tfieldLastName.trailingAnchor.constraint(equalTo: lineForName.trailingAnchor)
        let heightConstraintTFLastName = tfieldLastName.heightAnchor.constraint(equalToConstant: 30)
        NSLayoutConstraint.activate([topConstraintTFLastName, leadingConstraintTFLastName, trailingConstraintTFLastName, heightConstraintTFLastName])
        
        lineLastName.backgroundColor = .white
        
        let topConstraintLineLastName = lineLastName.topAnchor.constraint(equalTo: tfieldLastName.bottomAnchor, constant: 0.2)
        let leadingConstraintLineLastName = lineLastName.leadingAnchor.constraint(equalTo: tfieldLastName.leadingAnchor)
        let trailingConstraintLineLastName = lineLastName.trailingAnchor.constraint(equalTo: tfieldLastName.trailingAnchor)
        let heightConstraitnLineLastName = lineLastName.heightAnchor.constraint(equalToConstant: 1.5)
        NSLayoutConstraint.activate([topConstraintLineLastName, leadingConstraintLineLastName, trailingConstraintLineLastName, heightConstraitnLineLastName])
        
        tfieldMail.attributedPlaceholder = NSAttributedString(string: "Mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tfieldMail.textColor = .white
        tfieldMail.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tfieldMail.tintColor = .systemRed
        
        let topConstraintTFMail = tfieldMail.topAnchor.constraint(equalTo: lineLastName.bottomAnchor, constant: 30)
        let leadingConstraintTFMail = tfieldMail.leadingAnchor.constraint(equalTo: lineLastName.leadingAnchor)
        let trailingConstraintTFMail = tfieldMail.trailingAnchor.constraint(equalTo: lineLastName.trailingAnchor)
        let heightConstraintTFMail = tfieldMail.heightAnchor.constraint(equalToConstant: 30)
        NSLayoutConstraint.activate([topConstraintTFMail, leadingConstraintTFMail, trailingConstraintTFMail, heightConstraintTFMail])
        
        lineMail.backgroundColor = .white
        
        let topConstraintLineMail = lineMail.topAnchor.constraint(equalTo: tfieldMail.bottomAnchor, constant: 0.2)
        let leadingConstraintLineMail = lineMail.leadingAnchor.constraint(equalTo: tfieldMail.leadingAnchor)
        let trailingConstraintLineMail = lineMail.trailingAnchor.constraint(equalTo: tfieldMail.trailingAnchor)
        let heightConstraintLineMail = lineMail.heightAnchor.constraint(equalToConstant: 1.5)
        NSLayoutConstraint.activate([topConstraintLineMail, leadingConstraintLineMail, trailingConstraintLineMail, heightConstraintLineMail])
        
        tfieldPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tfieldPassword.textColor = .white
        tfieldPassword.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tfieldPassword.tintColor = .systemRed
        
        let topConstraintTFPassword = tfieldPassword.topAnchor.constraint(equalTo: lineMail.bottomAnchor, constant: 30)
        let leadingConstraintTFPassword = tfieldPassword.leadingAnchor.constraint(equalTo: lineMail.leadingAnchor)
        let trailingConstraintTFPassword = tfieldPassword.trailingAnchor.constraint(equalTo: lineMail.trailingAnchor)
        let heightConstraintTFPassword = tfieldPassword.heightAnchor.constraint(equalToConstant: 30)
        NSLayoutConstraint.activate([topConstraintTFPassword, leadingConstraintTFPassword, trailingConstraintTFPassword, heightConstraintTFPassword])
        
        linePassword.backgroundColor = .white
        
        let topConstraintLinePassword = linePassword.topAnchor.constraint(equalTo: tfieldPassword.bottomAnchor, constant: 0.2)
        let leadingConstraintLinePassword = linePassword.leadingAnchor.constraint(equalTo: tfieldPassword.leadingAnchor)
        let trailingConstraintLinePassword = linePassword.trailingAnchor.constraint(equalTo: tfieldPassword.trailingAnchor)
        let heightConstraintLinePassword = linePassword.heightAnchor.constraint(equalToConstant: 1.5)
        NSLayoutConstraint.activate([topConstraintLinePassword, leadingConstraintLinePassword, trailingConstraintLinePassword, heightConstraintLinePassword])
        
        labelError.isHidden = true
        labelError.text = "* Error en la contraseña"
        labelError.numberOfLines = 0
        labelError.textColor = .systemRed
        labelError.textAlignment = .center
        labelError.font = UIFont.boldSystemFont(ofSize: 13)
        
        let topConstraintError = labelError.topAnchor.constraint(equalTo: linePassword.bottomAnchor, constant: 20)
        let leadingConstraintError = labelError.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let trailingConstrraintError = labelError.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        NSLayoutConstraint.activate([topConstraintError, leadingConstraintError, trailingConstrraintError])
        
        buttonReady.setTitle("Sign Up", for: .normal)
        buttonReady.setTitleColor(.white, for: .normal)
        buttonReady.backgroundColor = .systemRed
        buttonReady.layer.cornerRadius = 25.0
        buttonReady.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonReady.layer.shadowColor = UIColor.lightGray.cgColor
        buttonReady.layer.shadowOffset = CGSize(width: 0, height: -1)
        buttonReady.layer.shadowOpacity = 0.5
        buttonReady.addTarget(self, action: #selector(buttonSignUp), for: .touchUpInside)
        
        let heightConstraintReady = buttonReady.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraintReady = buttonReady.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55)
        let trailingConstraintReady = buttonReady.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55)
        let bottomConstraintReady = buttonReady.bottomAnchor.constraint(equalTo: buttonCancel.topAnchor, constant: -10)
        NSLayoutConstraint.activate([heightConstraintReady, leadingConstraintReady, trailingConstraintReady, bottomConstraintReady])
        
        buttonCancel.setTitle("Cancel", for: .normal)
        buttonCancel.setTitleColor(.systemRed, for: .normal)
        buttonCancel.layer.cornerRadius = 8.0
        buttonCancel.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        buttonCancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonCancel.addTarget(self, action: #selector(backToTutorial), for: .touchUpInside)
        
        let bottomConstraintCancel = buttonCancel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        let leadingConstraintCancel = buttonCancel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailingConstraintCancel = buttonCancel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        let heightConstraintCancel = buttonCancel.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([bottomConstraintCancel, leadingConstraintCancel, trailingConstraintCancel, heightConstraintCancel])
    }
    
    @objc func backToTutorial() {
        UIView.animate(withDuration: 0.2) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc func buttonSignUp(_ sender: UIButton) {
        //Validas los campos
        let error = isValidFields()
        
        if error != nil {
            showError(error!)
            labelError.isHidden = false
        }else{
            let email = tfieldMail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = tfieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let firstName = tfieldName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = tfieldLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //1.Crear dictionary y guardar los datos del usuario en database
            var userDictionary = [String:String]()
            userDictionary = ["email": email, "password": password, "firstName":firstName, "lastName":lastName]
            //2. Creo el usuario
            Auth.auth().createUser(withEmail: email, password: password) { (result, erro) in
                //Chequeo si hay error en los datos
                if erro != nil{
                    self.labelError.text = erro!.localizedDescription
                    self.labelError.alpha = 1
                } else {
                    //3. Guardar datos del usuario en user
                    let db = Firestore.firestore()
                    db.collection("Users").addDocument(data: ["firstName":firstName,"lastName":lastName, "uid": result!.user.uid]) { (error) in
                        if error == nil {
                            self.showError("Error saving user data")
                        }
                    }
                    self.ref.child("Users").child(result!.user.uid).setValue(userDictionary)
                    //transition to homeView
                    let hv = HomeViewController()
                    self.navigationController?.pushViewController(hv, animated: true)
                }
            }
        }
    }
    
    func isValidFields() -> String? {
                 
         if tfieldName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfieldLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfieldMail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }

        let cleanedPassword = tfieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if ExtensionUtil.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and number"
        }
        return nil
    }
    
    func showError(_ message:String) {
        labelError.text = message
        labelError.alpha = 1
    }
    
}
