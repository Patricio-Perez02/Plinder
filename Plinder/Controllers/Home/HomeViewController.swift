//
//  HomeViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 17/04/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let labelHome = UILabel()
    let tableView = UITableView()
    var animationProfile : AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        view.addSubview(tableView)
        view.addSubview(labelHome)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        labelHome.translatesAutoresizingMaskIntoConstraints = false
        animationProfile?.translatesAutoresizingMaskIntoConstraints = false
        
        labelHome.text = "Plinder"
        labelHome.font = UIFont.boldSystemFont(ofSize: 30)
        labelHome.textAlignment = .left
        labelHome.textColor = .systemRed
        
        let topConstraintLabel = labelHome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        let leadingConstraintLabel = labelHome.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        let trailingConstraintLabel = labelHome.trailingAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([topConstraintLabel, leadingConstraintLabel, trailingConstraintLabel])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        tableView.register(HomeTableCell.self, forCellReuseIdentifier: "homeTableCell")
        
        let topConstraintTable = tableView.topAnchor.constraint(equalTo: labelHome.bottomAnchor, constant: 10)
        let bottomConstraintTable = tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        let leadingConstraintTable = tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraintTable = tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        NSLayoutConstraint.activate([topConstraintTable, bottomConstraintTable, leadingConstraintTable, trailingConstraintTable])
        
        animationProfile = .init(name: "AnimatedProfile")
        view.addSubview(animationProfile!)
        animationProfile?.tintColor = .white
        animationProfile?.frame = view.frame(forAlignmentRect: CGRect(x: view.frame.maxX - 40, y: labelHome.frame.maxY + 30, width: 30, height: 30))
        animationProfile?.loopMode = .loop
        animationProfile?.animationSpeed = 0.3
        animationProfile?.play()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableCell", for: indexPath) as! HomeTableCell
        return cell
    }
    
}
