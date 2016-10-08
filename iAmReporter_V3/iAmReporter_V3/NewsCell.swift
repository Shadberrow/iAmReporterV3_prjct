//
//  NewsCell.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 08.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            theme.text = post?.theme
            
            text.text = post?.text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let smallPhotoUrl: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.red
        return image
    }()
    
    let countViews: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
//        views.textColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1)
        views.backgroundColor = UIColor.yellow
        return views
    }()
    
    let date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textAlignment = .right
        date.backgroundColor = UIColor.brown
        return date
    }()
    
    let theme: UILabel = {
        let theme = UILabel()
        theme.translatesAutoresizingMaskIntoConstraints = false
        theme.numberOfLines = 2
        theme.font = UIFont.boldSystemFont(ofSize: 16)
//        theme.backgroundColor = UIColor.blue
        return theme
    }()
    
    let text: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .natural
        text.isScrollEnabled = false
        text.isUserInteractionEnabled = false
        text.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        text.font = UIFont(name: "Myriad Pro", size: 12)
        text.textColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1)
        text.textContainer.lineBreakMode = .byTruncatingTail
//        text.backgroundColor = UIColor.cyan
        return text
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.7, alpha: 1)
        return view
    }()
    
    func setupView() {
        
        backgroundColor = UIColor.white
        
        addSubview(smallPhotoUrl)
        addSubview(countViews)
        addSubview(date)
        addSubview(theme)
        addSubview(text)
        addSubview(separator)
        
        addConstraintsWithFormat("H:|-8-[v0(110)]-8-[v1]-8-|", views: smallPhotoUrl, theme)
        addConstraintsWithFormat("H:|-8-[v0(110)]-8-[v1]-8-|", views: smallPhotoUrl, text)
        addConstraintsWithFormat("H:|-8-[v0(35)][v1(75)]", views: countViews, date)
        addConstraintsWithFormat("H:|[v0]|", views: separator)
        addConstraintsWithFormat("V:|-8-[v0(100)]-8-[v1]-8-|", views: smallPhotoUrl, countViews)
        addConstraintsWithFormat("V:|-8-[v0(100)]-8-[v1]-8-|", views: smallPhotoUrl, date)
        addConstraintsWithFormat("V:|-8-[v0(40)]-3-[v1]-8-|", views: theme, text)
        addConstraintsWithFormat("V:[v0(1)]|", views: separator)
    }
    
}
















