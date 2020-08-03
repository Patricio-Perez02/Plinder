//
//  SignUpViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 21/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPass: UITextField!
    @IBOutlet weak var labelError: UILabel!
    
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelError.text! = ""
      
    }
    func isValidFields() -> String? {
                 
         if textFieldFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            textFieldLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            textFieldEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            textFieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            textFieldConfirmPass.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        //Chequea que la contraseña sea segura
        let cleanedPassword = textFieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if ExtensionUtil.isPasswordValid(cleanedPassword) == false {
            //Si no es segura pasara esto por mensaje
            return "Please make sure your password is at least 8 characters, contains a special character and number"
        }
        if textFieldPassword.text! != textFieldConfirmPass.text! {
            return "Passwords do not match please try again"
        }
        return nil
    }
    
    @IBAction func buttonSignUp(_ sender: UIButton) {
        //Validas los campos
        let error = isValidFields()
        
        if error != nil {
            showError(error!)
        }else{
            let email = textFieldEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = textFieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let firstName = textFieldFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = textFieldLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
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

                    UIApplication.shared.keyWindow?.rootViewController = hv
                    UIApplication.shared.keyWindow?.makeKeyAndVisible()

                    self.present(hv, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    func showError(_ message:String) {
        labelError.text = message
        labelError.alpha = 1
    }
    
}
