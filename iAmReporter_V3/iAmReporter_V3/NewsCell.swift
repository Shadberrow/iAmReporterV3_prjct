//
//  NewsCell.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 08.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

private var imageCache = NSCache<AnyObject, AnyObject>()

class NewsCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            self.setupImage()
            
            if let postText = self.post?.text {
                self.text.text = postText
            }
            
            if let postTheme = self.post?.theme {
                self.theme.text = postTheme
            }
            
            if let postViewCount = self.post?.countViews {
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "eye")
                attachment.bounds = CGRect.init(x: 0, y: -3, width: 12, height: 12)
                let attributedText = NSMutableAttributedString()
                attributedText.append(NSAttributedString(attachment: attachment))
                
                attributedText.append(NSAttributedString(string: " \(postViewCount)", attributes: [NSForegroundColorAttributeName: UIColor.rgb(red: 127, green: 48, blue: 103)]))
                
                self.countViews.attributedText = attributedText
            }
            
            if let postDateView = self.post?.date {
                let dayTimePeriodFormatter = DateFormatter()
                dayTimePeriodFormatter.dateFormat = "dd.MM.YYYY hh.mm"
                let formattedStringDate = dayTimePeriodFormatter.string(from: Date(timeIntervalSince1970: postDateView as! TimeInterval))
                let str = NSAttributedString(string: "| \(formattedStringDate)", attributes: [NSForegroundColorAttributeName: UIColor.black])
                
                self.date.attributedText = str
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageUrlString: String?
    
    func setupImage() {
        if let imageURL = post?.smallPhotoURL {
            
            let encode = imageURL.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) // encode url string
            let url = URL(string: encode!)
            
            imageUrlString = imageURL
            
            smallPhotoUrl.image = nil
            
            if let imgFromCache = imageCache.object(forKey: url as AnyObject) {
                self.smallPhotoUrl.image = imgFromCache as? UIImage
                return
            }
            
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, imgErr) in
                if imgErr != nil {
                    print(imgErr)
                    return
                }
                DispatchQueue.main.async {
                    let imgToCache = UIImage(data: data!)
                    if self.imageUrlString == imageURL {
                        self.smallPhotoUrl.image = UIImage(data: data!)
                    }
                    imageCache.setObject(imgToCache!, forKey: url as AnyObject)
                }
            }).resume()
        }
    }
    
    var smallPhotoUrl: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.backgroundColor = UIColor.white
        return image
    }()
    
    let countViews: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont(name: "HelveticaNeue-Light", size: 8)
//        views.backgroundColor = UIColor.gray
        return views
    }()
    
    let date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textAlignment = .right
        date.font = UIFont(name: "HelveticaNeue-Light", size: 8)
//        date.backgroundColor = UIColor.gray
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
        
//        addConstraintsWithFormat("H:|-8-[v0(110)]", views: smallPhotoUrl)
//        addConstraintsWithFormat("V:|-10-[v0(100)]", views: smallPhotoUrl)
        
        addConstraintsWithFormat("H:|-8-[v0(110)]-8-[v1]-8-|", views: smallPhotoUrl, theme)
        addConstraintsWithFormat("H:|-8-[v0(110)]-8-[v1]-8-|", views: smallPhotoUrl, text)
        addConstraintsWithFormat("H:|-8-[v0(35)][v1(75)]", views: countViews, date)
        addConstraintsWithFormat("H:|[v0]|", views: separator)
        addConstraintsWithFormat("V:|-8-[v0(100)]-9-[v1]-9-|", views: smallPhotoUrl, countViews)
        addConstraintsWithFormat("V:|-8-[v0(100)]-9-[v1]-9-|", views: smallPhotoUrl, date)
        addConstraintsWithFormat("V:|-8-[v0(40)]-3-[v1]-8-|", views: theme, text)
        addConstraintsWithFormat("V:[v0(1)]|", views: separator)
    }
    
}
















