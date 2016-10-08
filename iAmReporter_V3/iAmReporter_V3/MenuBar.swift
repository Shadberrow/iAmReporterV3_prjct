//
//  MenuBar.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 08.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    let newsCategory: UILabel = {
        let nc = UILabel()
        nc.text = "ALL NEWS"
        nc.textAlignment = .center
        nc.font = UIFont.boldSystemFont(ofSize: 8)
        nc.textColor = UIColor.white
        return nc
    }()
    
    let separatorLine: UIView = {
        let sl = UIView()
        sl.backgroundColor = UIColor.rgb(red: 50, green: 50, blue: 50)
        return sl
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor.rgb(red: 127, green: 48, blue: 103)
        
        addSubview(separatorLine)
        addSubview(newsCategory)
        
        addConstraintsWithFormat("H:|[v0]|", views: newsCategory)
        addConstraintsWithFormat("H:|[v0]|", views: separatorLine)
        addConstraintsWithFormat("V:|[v0(1)][v1]|", views: separatorLine, newsCategory)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
