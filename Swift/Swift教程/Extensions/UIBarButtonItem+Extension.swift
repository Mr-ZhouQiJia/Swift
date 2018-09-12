//
//  UIBarButtonItem+Extension.swift
//  Swift教程
//
//  Created by ddsc on 2018/9/12.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    //swift便利构造器方法:必须以convenience开头,结尾必须调用一个系统的构造器方法
    //可以给参数设置默认值 eg : highLightImage : String = ""
    
    convenience  init(image : String, highLightImage : String = "" , size : CGSize = CGSize.zero) {
        //1.设置按钮
        let button = UIButton()
        //2.给按钮设置图片
        button.setImage(UIImage(named: image), for: .normal)
        if highLightImage != ""{
        button.setImage(UIImage(named: highLightImage), for: .selected)
        }
        //3.给按钮设置尺寸
        if size == CGSize.zero{
            button.sizeToFit()
        }
        else{
        button.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        //调用系统初始化方法
        self.init(customView: button)
        
    }
    
    
    
    
    
    
    
}

