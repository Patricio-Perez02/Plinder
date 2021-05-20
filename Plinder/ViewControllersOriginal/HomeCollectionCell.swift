//
//  HomeCollectionCell.swift
//  Plinder
//
//  Created by Patricio Perez on 20/04/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    let containerView = UIView()
    let labelTitle = UILabel()
    let labelDescription = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        contentView.addSubview(containerView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(labelDescription)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .black
        
        let topConstraintContainer = containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        let bottomConstraintContainer = containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        let leadingConstraintContainer = containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2.5)
        let trailingConstraintContainer = containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        NSLayoutConstraint.activate([topConstraintContainer, bottomConstraintContainer, leadingConstraintContainer, trailingConstraintContainer])
        
        labelTitle.text = "Title"
        labelTitle.font = UIFont.init(name: "Avenir Next", size: 25)
        labelTitle.textColor = .white
        
        let bottomConstraintLTitle = labelTitle.bottomAnchor.constraint(equalTo: labelDescription.topAnchor, constant: -2.5)
        let leadingConstraintLTitle = labelTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5)
        let trailingConstraintLTitle = labelTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        NSLayoutConstraint.activate([bottomConstraintLTitle, leadingConstraintLTitle, trailingConstraintLTitle])
        
        labelDescription.text = "Description of the movie for the users"
        labelDescription.font = UIFont.init(name: "Avenir", size: 13)
        labelDescription.textColor = .white
        labelDescription.lineBreakMode = .byTruncatingTail
        labelDescription.numberOfLines = 0
        
        let bottomConstraintLDescription = labelDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        let leadingConstraintLDescription = labelDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7.5)
        let trailingConstraintLDescription = labelDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2.5)
        NSLayoutConstraint.activate([bottomConstraintLDescription, leadingConstraintLDescription, trailingConstraintLDescription])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
