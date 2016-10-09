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
    
    var newsCategory = "all"
    var city = ""
    var page = 2
    var load = true
    var posts = [Post]()
    
    func fetchNews() {
        
        var url = URLRequest(url: URL(string: "http://test.mediaretail.com.ua:8095/category/\(newsCategory)/\(page)")!)
        url.httpMethod = "POST"
        let postString = ("{\"city\":\"\(city)\"}").data(using: String.Encoding.utf8)
        url.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        url.httpBody = postString
        
        URLSession.shared.dataTask(with: url) { (data, response, jsonErr) in
            if jsonErr != nil {
                print(jsonErr)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                
                if let postArray = json["news"] as? [[String: AnyObject]] {
                    for dictionary in postArray {
                        let post = Post()
                        post.setValuesForKeys(dictionary)
                        self.posts.append(post)
                    }
                }
                
            } catch let err {
                print(err)
            }
            
        }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNews()
        
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

