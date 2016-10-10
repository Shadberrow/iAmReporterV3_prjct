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
    
    let topBarView: UIView = {
        let topBar = UIView()
        topBar.backgroundColor = UIColor.rgb(red: 127, green: 48, blue: 103)
        return topBar
    }()
    
    let allUkraineButton = createButton(name: "Вся Україна", logo: "city")
    let addNewsButton = createButton(name: "Створиті новину", logo: "add")
    let myReportersButton = createButton(name: "Мої репортери", logo: "microphone1")
    let answersButton = createButton(name: "Відповіді", logo: "answers")
    let readersButton = createButton(name: "Читачі", logo: "readers")
    let topNewsButton = createButton(name: "ТОП новин", logo: "thumb")
    let allReportersButton = createButton(name: "Всі репортери", logo: "microphone2")
    let allNewsButton = createButton(name: "Всі новини", logo: "allNews")
    let politicButton = createButton(name: "Політика", logo: "politics")
    let lifeButton = createButton(name: "Життя", logo: "life")
    let humorButton = createButton(name: "Гумор", logo: "humor")
    let sportButton = createButton(name: "Спорт", logo: "sport")
    let otherButton = createButton(name: "Інші", logo: "others")
    let favoriteButton = createButton(name: "Обрані", logo: "favorite")
    let rateAppButton = createButton(name: "Оцінити додаток", logo: "heart")
    let sendMailButton = createButton(name: "Надіслати повідомлення", logo: "mail")
    
    let separator1 = createSeparator()
    let separator2 = createSeparator()
    let separator3 = createSeparator()
    let separator4 = createSeparator()
    let separator5 = createSeparator()
    let separator6 = createSeparator()
    
    func setupView() {
        
        backgroundColor = UIColor.white
        
        addSubview(topBarView)
        addSubview(allUkraineButton)
        addSubview(addNewsButton)
        addSubview(myReportersButton)
        addSubview(answersButton)
        addSubview(readersButton)
        addSubview(topNewsButton)
        addSubview(allReportersButton)
        addSubview(allNewsButton)
        addSubview(politicButton)
        addSubview(lifeButton)
        addSubview(humorButton)
        addSubview(sportButton)
        addSubview(otherButton)
        addSubview(favoriteButton)
        addSubview(rateAppButton)
        addSubview(sendMailButton)
        addSubview(separator1)
        addSubview(separator2)
        addSubview(separator3)
        addSubview(separator4)
        addSubview(separator5)
        addSubview(separator6)
        
        addConstraintsWithFormat("H:|[v0]|", views: topBarView)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: allUkraineButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: addNewsButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: myReportersButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: answersButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: readersButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: topNewsButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: allReportersButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: allNewsButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: politicButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: lifeButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: humorButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: sportButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: otherButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: favoriteButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: rateAppButton)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", views: sendMailButton)
        addConstraintsWithFormat("H:|[v0]|", views: separator1)
        addConstraintsWithFormat("H:|[v0]|", views: separator2)
        addConstraintsWithFormat("H:|[v0]|", views: separator3)
        addConstraintsWithFormat("H:|[v0]|", views: separator4)
        addConstraintsWithFormat("H:|[v0]|", views: separator5)
        addConstraintsWithFormat("H:|[v0]|", views: separator6)
        
        addConstraintsWithFormat("V:|[v0(105)]"
            + "-14-[v1(31)]"
            + "-14-[v17(1)]"
            + "-14-[v2(31)]"
            + "-14-[v18(1)]"
            + "-14-[v3(31)][v4(31)][v5(31)]"
            + "-14-[v19(1)]"
            + "-14-[v6(31)][v7(31)]"
            + "-14-[v20(1)]"
            + "-14-[v8(31)][v9(31)][v10(31)][v11(31)][v12(31)][v13(31)][v14(31)]"
            + "-14-[v21(1)]"
            + "-14-[v15(31)][v16(31)]"
            + "-14-[v22(1)]",
            views: topBarView,
            allUkraineButton,
            addNewsButton,
            myReportersButton, answersButton, readersButton,
            topNewsButton, allReportersButton,
            allNewsButton, politicButton, lifeButton, humorButton, sportButton, otherButton, favoriteButton,
            rateAppButton, sendMailButton, separator1, separator2, separator3, separator4, separator5, separator6)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


func createButton (name: String, logo: String) -> UIButton {
    
    let attachment = NSTextAttachment()
    attachment.image = UIImage(named: logo)
    attachment.bounds = CGRect.init(x: 0, y: -3, width: 19, height: 19)
    let attributedText = NSMutableAttributedString()
    attributedText.append(NSAttributedString(attachment: attachment))
    attributedText.append(NSAttributedString(string: "   \(name)", attributes: [NSForegroundColorAttributeName: UIColor.black]))
    
    let button = UIButton()
    button.setAttributedTitle(attributedText, for: .normal)
    button.titleLabel?.font = UIFont(name: "SFUIDisplay Regular", size: 18)
    button.contentHorizontalAlignment = .left
    
    return button
}

func createSeparator() -> UIView {
    let line = UIView()
    line.backgroundColor = UIColor(white: 0.4, alpha: 0.5)
    return line
}























