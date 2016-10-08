//
//  ViewController.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 08.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

let cellID = "NewsCellID"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var posts: [Post] = {
        let blanketPost = Post()
        blanketPost.theme = "We all gonna die  We all gonna die We all gonna die We all gonna die We all gonna die We all gonna die"
        blanketPost.text = "All people will die  We all gonna die We all gonna die We all gonna die We all gonna die We all gonna die  We all gonna die We all gonna die We all gonna die We all gonna die We all gonna die ё We all gonna die We all gonna die We all gonna die We all gonna die We all gonna die  We all gonna die We all gonna die We all gonna die We all gonna die We all gonna die  We all gonna die We all gonna die We all gonna die We all gonna die We all gonna die"
        return [blanketPost]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(NewsCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
        collectionView?.alwaysBounceVertical = true
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(15, 0, 0, 0)
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleView = UIImageView(image: UIImage(named: "logo"))
        titleView.frame = CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 30, height: 30)
        titleView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleView
        
        setupMenuBar()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(15)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NewsCell
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }

}

