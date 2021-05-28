//
//  HomeCell.swift
//  Plinder
//
//  Created by Patricio Perez on 20/04/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import SketchKit
import SDWebImage

class HomeTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let containerView = UIView()
    let collectionLayout = UICollectionViewFlowLayout.init()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let labelGeners = UILabel()

    var listMovies : ListMovies?
    
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
        
        let service = ServiceListMovies(baseUrl: "https://api.themoviedb.org/4/")
        service.getListHome(type: "list/1?page=1&api_key=d274162456c2163d64d3db486d400f6e")
        service.completionHandler {[weak self] (list, status, messages) in
            if status{
                guard let self = self else {return}
                guard let listMovies = list else {return}
                self.listMovies = listMovies
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2.85, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMovies?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as! HomeCollectionCell
        if let movies = listMovies {
            let detailMovies = movies.results[indexPath.item]
            cell.imageViewPoster.sd_setImage(with: URL(string: detailMovies.posterPath), placeholderImage: nil)
        }
        
        return cell
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
