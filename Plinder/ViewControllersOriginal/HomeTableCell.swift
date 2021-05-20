//
//  HomeCell.swift
//  Plinder
//
//  Created by Patricio Perez on 20/04/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import SketchKit

class HomeTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let containerView = UIView()
    let collectionLayout = UICollectionViewFlowLayout.init()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let labelGeners = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        contentView.addSubview(containerView)
        containerView.addSubview(labelGeners)
        containerView.addSubview(collectionView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        labelGeners.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        let topConstraintContainer = containerView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let bottomConstraintContainer = containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let leadingConstraintContainer = containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let trailingConstraintContainer = containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let heightConstraintContainer = containerView.heightAnchor.constraint(equalToConstant: 250)
        NSLayoutConstraint.activate([topConstraintContainer, bottomConstraintContainer, trailingConstraintContainer, leadingConstraintContainer, heightConstraintContainer])
        
        labelGeners.text = "Drama"
        labelGeners.font = UIFont.boldSystemFont(ofSize: 25)
        labelGeners.textColor = .white
        
        let topConstraintLabel = labelGeners.topAnchor.constraint(equalTo: contentView.topAnchor)
        let leadingConstraintLabel = labelGeners.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        let trailingConstraintLabel = labelGeners.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        NSLayoutConstraint.activate([topConstraintLabel, leadingConstraintLabel, trailingConstraintLabel])
        
        collectionLayout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(collectionLayout, animated: true)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = false
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: "homeCollectionCell")
        
        let topConstraintCollection = collectionView.topAnchor.constraint(equalTo: labelGeners.bottomAnchor)
        let bottomConstraintCollection = collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        let leadingConstraintCollection = collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        let trailingConstraintCollection = collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        NSLayoutConstraint.activate([topConstraintCollection, bottomConstraintCollection, leadingConstraintCollection, trailingConstraintCollection])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2.85, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as! HomeCollectionCell
    
        return cell
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
