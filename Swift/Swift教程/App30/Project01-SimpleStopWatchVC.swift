//
//  Project01-SimpleStopWatchVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/16.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit
class Project01_SimpleStopWatchVC: UIViewController {

    var numLabel: UILabel?
    var leftBtn : UIButton?
    var rightBtn : UIButton?
    var stopBtn : UIButton?
    //计时器
    var timer = Timer()
    var  counter = 0.00
    var isPlaying = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        buildUI()
        
        
        

    }

    func buildUI()  {
        self.numLabel = UILabel.init()
        self.numLabel?.text = "0.00"
        self.numLabel?.isUserInteractionEnabled = true
        self.numLabel?.textAlignment = NSTextAlignment.center
        self.numLabel?.textColor = UIColor.white
        self.numLabel?.font = UIFont.systemFont(ofSize: 40)
        self.numLabel?.backgroundColor = UIColor.black
        self.view.addSubview(self.numLabel!)
        //被废弃了
        /*
        self.numLabel?.snp_makeConstraints({ (make) in
            
        })
         */
        self.numLabel?.snp.makeConstraints({ (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(200)
        })
        
        self.leftBtn = UIButton()
        leftBtn?.backgroundColor = UIColor.blue
        self.view.addSubview(self.leftBtn!)
        leftBtn?.setTitle("开始", for: UIControlState.normal)
        leftBtn?.addTarget(self, action: #selector(begin), for: UIControlEvents.touchUpInside)
        leftBtn?.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo((self.numLabel?.snp.bottom)!)
            make.width.equalTo(AppWidth / 2)
            make.bottom.equalTo(self.view)
        }
        
        self.rightBtn = UIButton()
        rightBtn?.backgroundColor = UIColor.green
        self.view.addSubview(self.rightBtn!)
        rightBtn?.setTitle("暂停", for: UIControlState.normal)
        rightBtn?.addTarget(self, action: #selector(pause), for: UIControlEvents.touchUpInside)
        rightBtn?.snp.makeConstraints { (make) in
            make.right.equalTo(self.view)
            make.top.equalTo((self.numLabel?.snp.bottom)!)
            make.width.equalTo(AppWidth / 2)
            make.bottom.equalTo(self.view)
        }
        
        //结束按钮
        self.stopBtn = UIButton()
        stopBtn?.backgroundColor = UIColor.red
        self.numLabel?.addSubview(self.stopBtn!)
        stopBtn?.setTitle("reset", for: UIControlState.normal)
        stopBtn?.addTarget(self, action: #selector(rest), for: UIControlEvents.touchUpInside)
        stopBtn?.snp.makeConstraints { (make) in
            make.right.equalTo(self.numLabel!).offset(-25)
            make.top.equalTo(self.numLabel!).offset(25)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        
        
    }
    @objc func begin()  {
        print("开始")
        self.leftBtn?.isEnabled = false
        self.rightBtn?.isEnabled = true

        self.isPlaying = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
        
        
        
    }
    @objc func pause(){
        print("暂停")
        self.leftBtn?.isEnabled = true
        self.rightBtn?.isEnabled = false
        
        timer.invalidate()
    }
    
    @objc func rest(){
        print("rest")
        self.leftBtn?.isEnabled = true
        self.rightBtn?.isEnabled = false
        timer.invalidate()
        counter = 0.00
        numLabel?.text = "\(counter)"
    }
    
    @objc func updateTimer()  {
        counter = counter + 0.01 
        numLabel?.text = String(format: "%.01f", counter)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
