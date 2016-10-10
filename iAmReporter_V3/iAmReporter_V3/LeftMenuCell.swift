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
        
        allUkraineButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        addNewsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        myReportersButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        answersButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        readersButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        topNewsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        allReportersButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        allNewsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        politicButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        lifeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        humorButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        sportButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        otherButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        rateAppButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        sendMailButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    func buttonTapped(sender: UIButton) {
        print(sender.buttonType)
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
            + "-6-[v1(46)]"
            + "-6-[v17(1)]" // separator
            + "-6-[v2(46)]"
            + "-6-[v18(1)]" // separator
            + "-6-[v3(36)][v4(36)][v5(36)]"
            + "-6-[v19(1)]" // separator
            + "-6-[v6(36)][v7(36)]"
            + "-6-[v20(1)]" // separator
            + "-6-[v8(36)][v9(36)][v10(36)][v11(36)][v12(36)][v13(36)][v14(36)]"
            + "-6-[v21(1)]" // separator
            + "-6-[v15(36)][v16(36)]"
            + "-6-[v22(1)]", // separator
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
    attachment.image = UIImage(named: logo)?.withRenderingMode(.alwaysOriginal)
    attachment.bounds = CGRect.init(x: 0, y: -3, width: 19, height: 19)
    let attributedText = NSMutableAttributedString()
    attributedText.append(NSAttributedString(attachment: attachment))
    attributedText.append(NSAttributedString(string: "   \(name)", attributes: [NSForegroundColorAttributeName: UIColor.black]))
    
    let attachmentTap = NSTextAttachment()
    attachmentTap.image = UIImage(named: logo)?.withRenderingMode(.alwaysTemplate)
    attachmentTap.bounds = CGRect.init(x: 0, y: -3, width: 19, height: 19)
    let attributedTextTap = NSMutableAttributedString()
    attributedTextTap.append(NSAttributedString(attachment: attachmentTap))
    attributedTextTap.append(NSAttributedString(string: "   \(name)", attributes: [NSForegroundColorAttributeName: UIColor.black]))
    
    let button = UIButton()
    button.setAttributedTitle(attributedText, for: .normal)
    
    button.setAttributedTitle(attributedTextTap, for: .highlighted)
    button.tintColor = UIColor.red
    
    button.titleLabel?.font = UIFont(name: "SFUIDisplay Regular", size: 18)
    button.contentHorizontalAlignment = .left
    
    
    return button
}

func createSeparator() -> UIView {
    let line = UIView()
    line.backgroundColor = UIColor(white: 0.4, alpha: 0.5)
    return line
}























