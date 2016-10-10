//
//  LeftMenuCell.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 09.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class LeftMenuCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            setupView()
    }
    
    func setupView() {
        
        backgroundColor = UIColor.cyan
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
