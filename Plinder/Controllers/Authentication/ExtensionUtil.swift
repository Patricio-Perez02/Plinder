//
//  ExtensionUtil.swift
//  Plinder
//
//  Created by Patricio Perez on 23/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import UIKit

class ExtensionUtil: UIViewController {

    struct ApiDetails {
        static let apiKey = "d274162456c2163d64d3db486d400f6e"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate (format: "SELF MATCHES %@", "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{8,15}")
        return passwordTest.evaluate(with: password)
    }
    
    
}
