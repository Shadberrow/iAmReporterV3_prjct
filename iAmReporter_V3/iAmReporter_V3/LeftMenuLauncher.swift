//
//  LeftMenuLauncher.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 09.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class LeftMenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()
    
    let collectionWiew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let cellID = "LeftMenuCellID"
    
    func showLeftMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            let windowSwipeDismiss = UISwipeGestureRecognizer(target: self, action: #selector(handleDismiss))
            windowSwipeDismiss.direction = .left
            window.addGestureRecognizer(windowSwipeDismiss)
            
            window.addSubview(blackView)
            window.addSubview(collectionWiew)
            window.windowLevel = (UIWindowLevelStatusBar + 1)
//            window.makeKeyAndVisible()
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            collectionWiew.frame = CGRect.init(x: 0, y: 0, width: 0, height: window.frame.height)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionWiew.frame = CGRect.init(x: 0, y: 0, width: window.frame.width * 0.7, height: window.frame.height)
                }, completion: nil)
        }
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.3) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionWiew.frame = CGRect.init(x: 0, y: 0, width: -window.frame.width * 0.7, height: window.frame.height)
                window.windowLevel = (UIWindowLevelStatusBar - 1)
            }
            
        }
    }
    
    override init() {
        super.init()
        
        collectionWiew.dataSource = self
        collectionWiew.delegate = self
        
        collectionWiew.register(LeftMenuCell.self, forCellWithReuseIdentifier: cellID)
//        collectionWiew.contentInset = UIEdgeInsetsMake(19, 0, 0, 0)
//        collectionWiew.scrollIndicatorInsets = UIEdgeInsetsMake(19, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionWiew.frame.width, height: self.collectionWiew.frame.height*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionWiew.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
}
















