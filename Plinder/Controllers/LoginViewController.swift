//
//  LoginViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 21/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var labelError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        
        let email = textFieldEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = textFieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //login the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.labelError.text = error?.localizedDescription
                self.labelError.alpha = 1
            } else {
                let hv = HomeViewController()

                UIApplication.shared.keyWindow?.rootViewController = hv
                UIApplication.shared.keyWindow?.makeKeyAndVisible()

                self.present(hv, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func buttonSignUp(_ sender: UIButton) {
        
        let sv = SignUpViewController()

        UIApplication.shared.keyWindow?.rootViewController = sv
        UIApplication.shared.keyWindow?.makeKeyAndVisible()

        self.present(sv, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
