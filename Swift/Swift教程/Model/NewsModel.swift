//
//  NewsModel.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/30.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class NewsModel: BaseModel {
  @objc  var url : String?
  @objc  var pic1 : String?
  @objc  var pic2 : String?
  @objc  var pic3 : String?
  @objc  var author : String?
  @objc  var title : String?
  @objc  var newsTime : String?
  @objc  var id : Any?
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
