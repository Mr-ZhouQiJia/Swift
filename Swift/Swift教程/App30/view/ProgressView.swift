//
//  ProgressView.swift
//  Swift教程
//
//  Created by ddsc on 2018/9/6.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    /**
     进度条背景颜色
     */
   // private var progressBackcolor : UIColor? = UIColor()
    var progressBackColor : UIColor?
//    {
//        set{
//            progressBackcolor = newValue
//            self.bottonView?.backgroundColor = newValue
//        }
//        get{
//            return  progressBackcolor!
//        }
//    }
    
    /**
     进度条颜色
     */
  //  private var progressviewColor : UIColor? = UIColor()
    var progressViewColor : UIColor?
//    {
//        set{
//            progressviewColor = newValue
//            self.progressView?.backgroundColor = newValue
//        }
//        get{
//            return progressviewColor!
//        }
//    }
    
    /**
     进度
     */
    private var progressvalue : CGFloat? = CGFloat()
    var progressValue : CGFloat
    {
        set{
            print(newValue as Any )
            progressvalue = newValue
            UIView.animate(withDuration: 5) {
                self.progressView?.frame = CGRect(x: (self.progressView?.frame.origin.x)!, y: (self.progressView?.frame.origin.y)!, width: (self.bottonView?.frame.size.width)! * newValue, height: (self.progressView?.frame.size.height)!)
            }
            


        }get{
            return progressvalue!
        }
    }
    
    /**
    进度条速度
    */
    var progressSpeed : CGFloat?
    
    /**
     背景View
     */
    var bottonView : UIView?
    
    /**
     进度条View
     */
    var  progressView : UIView?
    
   convenience init(frame: CGRect , progressBackColor :UIColor ,progressViewColor : UIColor , progressValue : CGFloat ) {
       self.init(frame: frame)
       self.buildUI()
       self.progressBackColor = progressBackColor
       self.progressViewColor = progressViewColor
       self.progressValue = progressValue
    }
    
    convenience init( progressBackColor :UIColor ,progressViewColor : UIColor , progressValue : CGFloat ) {
        self.init()
        self.buildUI()
        self.progressBackColor = progressBackColor
        self.progressViewColor = progressViewColor
        self.progressValue = progressValue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildUI(){
       // self.backgroundColor = UIColor.yellow
        
        
       // self.progressView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: (bottonView?.frame.size.height)!))
        
        
    }
    
    override func layoutSubviews() {
        self.bottonView = UIView(frame: self.bounds)
        
        self.addSubview(self.bottonView!)
        self.bottonView?.backgroundColor = self.progressBackColor
        self.bottonView?.layer.masksToBounds = true
        self.bottonView?.layer.cornerRadius = 3
        self.progressView = UIView()
        
        self.bottonView?.addSubview(self.progressView!)
        self.progressValue = 0.8
    
        self.progressView?.frame = CGRect(x: 0, y: 0, width: 0, height: (self.bottonView?.frame.size.height)!)
        
        self.progressView?.backgroundColor = self.progressViewColor
        self.progressView?.layer.masksToBounds = true
        self.progressView?.layer.cornerRadius = 3
    }
    
}
