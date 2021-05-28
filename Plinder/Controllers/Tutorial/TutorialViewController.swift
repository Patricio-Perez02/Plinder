//
//  LogInViewController.swift
//  Plinder
//
//  Created by Patricio Perez on 12/01/2021.
//  Copyright © 2021 Patricio Perez. All rights reserved.
//

import UIKit
import JXPageControl

class TutorialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let containerView = UIView()
    
    //Obj for control swipe
    let buttonPrevious = UIButton()
    let buttonNext = UIButton()
    let pageControl = JXPageControlJump()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout = UICollectionViewFlowLayout.init()
    
    let pages = [
        Page(image: "logo_plinder_pre.png", title: "HELLO! WELCOME TO PLINDER", subtitle: "The best aplication the Films, created to know your tastes and recommend you according to them"),
        Page(image: "icon_film.png", title: "VALUE AND DISCORVER", subtitle: "Comment on movies or series you have seen and discover others similar to your favorites"),
        Page(image: "logo_plinder_pre.png", title: "LET'S START", subtitle: "")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [buttonPrevious, pageControl, buttonNext])
        
        view.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        
        view.addSubview(containerView)
        view.addSubview(stackView)
        containerView.addSubview(collectionView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buttonPrevious.translatesAutoresizingMaskIntoConstraints = false
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .red
        
        let topConstraintContainer = containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraintContainer = containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraintContainer = containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomConstraintContainer = containerView.bottomAnchor.constraint(equalTo: stackView.topAnchor)
        NSLayoutConstraint.activate([topConstraintContainer, leadingConstraintContainer, trailingConstraintContainer, bottomConstraintContainer])
        
        stackView.distribution = .fillEqually

        buttonPrevious.setTitle("PREV", for: .normal)
        buttonPrevious.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        buttonPrevious.setTitleColor(.gray, for: .normal)
        buttonPrevious.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttonPrevious.titleLabel?.textAlignment = .left
        buttonPrevious.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        
        buttonNext.setTitle("NEXT", for: .normal)
        buttonNext.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        buttonNext.setTitleColor(.systemRed, for: .normal)
        buttonNext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttonNext.titleLabel?.textAlignment = .right
        buttonNext.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.isAnimation = true
        pageControl.inactiveColor = UIColor.gray
        pageControl.activeColor = UIColor.red
        //pageControl.activeSize = CGSize(width: 22.5, height: 10)
        pageControl.columnSpacing = 15

        let leadingContraintStack = stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraintStack = stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let bottomConstraintStack = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        let heightConstraintStack = stackView.heightAnchor.constraint(equalToConstant: 35)
        NSLayoutConstraint.activate([leadingContraintStack, trailingConstraintStack, bottomConstraintStack, heightConstraintStack])
        
        //MARK: -CollectionView
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.isPagingEnabled = true
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = UIColor.init(red: 40/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "pageCell")
        
        let topConstraintCollection = collectionView.topAnchor.constraint(equalTo: containerView.topAnchor)
        let leadingConstraintCollection = collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        let trailingConstraintCollection = collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        let bottomConstriantCollection = collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        NSLayoutConstraint.activate([topConstraintCollection, leadingConstraintCollection, trailingConstraintCollection, bottomConstriantCollection])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: containerView.frame.width , height: containerView.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as! PageCell
        let content = pages[indexPath.item]
        cell.backgroundColor = .white
        cell.imageView.image = UIImage(named: content.image)
        cell.labelTitle.text = content.title
        cell.labelSubtitle.text = content.subtitle
        //cell.labelSubtitle.isHidden = false
        //cell.buttonLogin.isHidden = true
        //cell.buttonSignup.isHidden = true
        
        if indexPath.item == (pages.count - 1) {
            cell.labelSubtitle.isHidden = true
            cell.buttonLogin.isHidden = false
            cell.buttonSignup.isHidden = false
        }
        cell.buttonSignup.addTarget(self, action: #selector(goToSignup), for: .touchUpInside)
        cell.buttonLogin.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return cell
    }
    
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handlePrevious() {
        let nextIndex = min(pageControl.currentPage - 1, 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    @objc func goToSignup() {
        let signup = SignupViewController()
        self.navigationController?.pushViewController(signup, animated: true)
    }
    
    @objc func goToLogin() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
