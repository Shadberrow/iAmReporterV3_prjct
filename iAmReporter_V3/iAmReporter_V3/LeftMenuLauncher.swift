//
//  LeftMenuLauncher.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 09.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class LeftMenuLauncher: NSObject {
    
    let blackView = UIView()
    
    let collectionWiew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func showLeftMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            let windowSwipeDismiss = UISwipeGestureRecognizer(target: self, action: #selector(handleDismiss))
            windowSwipeDismiss.direction = .left
            window.addGestureRecognizer(windowSwipeDismiss)
            
            window.addSubview(blackView)
            window.addSubview(collectionWiew)

            blackView.frame = window.frame
            blackView.alpha = 0
            
            collectionWiew.frame = CGRect.init(x: 0, y: 0, width: -window.frame.width, height: window.frame.height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                self.blackView.alpha = 1
                self.collectionWiew.frame = CGRect.init(x: 0, y: 0, width: window.frame.width * 0.7, height: window.frame.height)
                }, completion: nil)
        }
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionWiew.frame = CGRect.init(x: 0, y: 0, width: -window.frame.width, height: window.frame.height)
            }
            
        }
    }
    
    override init() {
        super.init()
        
    }
}

