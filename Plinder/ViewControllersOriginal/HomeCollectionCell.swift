//
//  HomeCollectionCell.swift
//  Plinder
//
//  Created by Patricio Perez on 20/04/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import SketchKit

class HomeCollectionCell: UICollectionViewCell {
    
    let containerView = UIView()
    let imageViewPoster = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        contentView.addSubview(containerView)
        contentView.addSubview(imageViewPoster)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageViewPoster.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .black
        
        containerView.layout.applyConstraint { view in
            view.topAnchor(equalTo: contentView.topAnchor, constant: 5)
            view.bottomAnchor(equalTo: contentView.bottomAnchor, constant: -5)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 2.5)
            view.trailingAnchor(equalTo: contentView.trailingAnchor)
        }
        
        imageViewPoster.contentMode = .scaleAspectFill
        
        imageViewPoster.layout.applyConstraint { image in
            image.topAnchor(equalTo: containerView.topAnchor)
            image.bottomAnchor(equalTo: containerView.bottomAnchor)
            image.leadingAnchor(equalTo: containerView.leadingAnchor)
            image.trailingAnchor(equalTo: containerView.trailingAnchor)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
