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
    var page = 0
    var loadMore = true
    var dispatch = false
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
                if let available = json["available"] as? Bool {
                    if available == true {
                        self.page += 1
                    } else {
                        self.loadMore = false
                    }
                }
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
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
        
        let windowLeftMenuApper = UISwipeGestureRecognizer(target: self, action: #selector(leftMenu))
        windowLeftMenuApper.direction = .right
        collectionView?.addGestureRecognizer(windowLeftMenuApper)
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleView = UIImageView(image: UIImage(named: "logo"))
        titleView.frame = CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 30, height: 30)
        titleView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleView
        
        setupMenuBar()
        setupNavBarButtons()
    }
    
    private func setupMenuBar() {
        
        let menuBar: MenuBar = {
            let mb = MenuBar()
            return mb
        }()
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(15)]", views: menuBar)
    }
    
    func setupNavBarButtons() {
        let leftBarButton = UIButton(type: .custom)
        leftBarButton.setImage(UIImage(named: "menu"), for: UIControlState.normal)
        leftBarButton.addTarget(self, action: #selector(leftMenu), for: UIControlEvents.touchUpInside)
        leftBarButton.frame = CGRect.init(x: 0, y: 0, width: 35, height: 35)
        let barItemLeft = UIBarButtonItem.init(customView: leftBarButton)
        navigationItem.leftBarButtonItem = barItemLeft
        
        let rightBarButton = UIButton(type: .custom)
        rightBarButton.setImage(UIImage(named: "addNews"), for: UIControlState.normal)
        rightBarButton.addTarget(self, action: #selector(rightMenu), for: UIControlEvents.touchUpInside)
        rightBarButton.frame = CGRect.init(x: 0, y: 0, width: 35, height: 35)
        let barItemRight = UIBarButtonItem.init(customView: rightBarButton)
        navigationItem.rightBarButtonItem = barItemRight
        
    }
    
    let leftMenuLauncher = LeftMenuLauncher()
    
    func leftMenu() {
        leftMenuLauncher.showLeftMenu()
    }
    
    func rightMenu() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NewsCell
        DispatchQueue.main.async {
            cell.post = self.posts[indexPath.item]
        }
        if indexPath.item == posts.count - 1 {
            if loadMore {
                fetchNews()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }

}

