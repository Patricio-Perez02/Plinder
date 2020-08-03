//
//  HomeViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 27/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var homeFilms = [HomeFilms]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MyCellView", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        let homeService = HomeService(baseUrl: "https://api.themoviedb.org/3/trending/all/day?api_key=")
        homeService.getMovieHome(apiKey: "d274162456c2163d64d3db486d400f6e")
        homeService.completionHandler {[weak self] (films, status, messages) in
            if status{
                guard let self = self else {return}
                guard let _films = films else {return}
                self.homeFilms = _films
                self.collectionView.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 //return films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeFilms.count
        //return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCellView;
        //let homeFilm = homeFilms[indexPath.row]
        //cell.imageView.image = UIImage(named: film.posterPath)
        //cell.labelTitle.text = film.originalTitle
        //cell.labelTitle.text = homeFilm.
        cell.labelTitle.text! = "Hola soy pato"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*0.9)
    }
}

