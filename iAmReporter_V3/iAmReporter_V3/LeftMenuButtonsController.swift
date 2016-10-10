//
//  LeftMenuButtonsController.swift
//  iAmReporter_V3
//
//  Created by Yevhenii Veretennikov on 10.10.16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

var newsCategory = String()
let getFeed = FeedController()

class LeftMenuButtonController: NSObject {
    
    func allUkraine() {
        
    }
    
    func addNews() {
        
    }
    
    func myReporters() {
        
    }
    
    func answers() {
        
    }
    
    func readers() {
        
    }
    
    func topNews() {
        
    }
    
    func allReporters() {
        
    }
    
    func allNews() {
        newsCategory = "all"
        getFeed.fetchNews(newsCategory: newsCategory, city: "")
    }
    
    func politics() {
        newsCategory = "politics"
    }
    
    func life() {
        newsCategory = "life"
    }
    
    func humor() {
        newsCategory = "humor"
    }
    
    func sport() {
        newsCategory = "sport"
    }
    
    func others() {
        newsCategory = "other"
    }
    
    func favorite() {
        
    }
    
    func rateApp() {
        
    }
    
    func sendMail() {
        
    }
    
}
