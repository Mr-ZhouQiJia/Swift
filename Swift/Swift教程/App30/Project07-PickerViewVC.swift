//
//  Project07-PickerViewVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/8/9.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project07_PickerViewVC: BaseViewController {

    var getAddress : UIButton?
    var getDate : UIButton?
    var address : UILabel?
    var date : UILabel?
    
    //日期选择器
    var datePicker : UIPickerView?
    var addressPicker : UIPickerView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getAddress = UIButton()
        self.view.addSubview(self.getAddress!)
        
        self.getAddress?.setTitle("获取地址", for: UIControlState.normal)
        self.getAddress?.backgroundColor = UIColor.orange
        self.getAddress?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.getAddress?.layer.masksToBounds = true
        self.getAddress?.layer.cornerRadius = 10
        self.getAddress?.addTarget(self, action: #selector(clickGetAddress), for: UIControlEvents.touchUpInside)
        self.getAddress?.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.view).offset(30)
            make.top.equalTo(self.view).offset(100)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
        self.address = UILabel()
        self.view.addSubview(self.address!)
        
        self.address?.backgroundColor = UIColor.lightGray
        self.address?.layer.masksToBounds = true
        self.address?.layer.cornerRadius = 10
        self.address?.snp.makeConstraints { (make) in
            
            make.height.equalTo(self.getAddress!)
            make.left.equalTo(self.getAddress!.snp.right).offset(10)
            make.right.equalTo(self.view).offset(-20)
            make.centerY.equalTo(self.getAddress!)
            
        }
        
        self.getDate = UIButton()
        self.view.addSubview(self.getDate!)
        self.getDate?.setTitle("获取日期", for: UIControlState.normal)
        self.getDate?.addTarget(self, action: #selector(clickGetDate), for: UIControlEvents.touchUpInside)
        self.getDate?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.getDate?.backgroundColor = UIColor.orange
        self.getDate?.layer.masksToBounds = true
        self.getDate?.layer.cornerRadius = 10
        self.getDate?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.getAddress!.snp.bottom).offset(10)
            make.width.height.equalTo(self.getAddress!)
            make.left.equalTo(self.view).offset(30)
        })
        
        self.date = UILabel()
        self.view.addSubview(self.date!)
        self.date?.backgroundColor = UIColor.lightGray
        self.date?.layer.masksToBounds = true
        self.date?.layer.cornerRadius = 10
        self.date?.snp.makeConstraints { (make) in
            make.left.equalTo(self.getDate!.snp.right).offset(10)
            make.height.equalTo(self.address!)
            make.width.equalTo(self.address!)
            make.centerY.equalTo(self.getDate!)
        }
        
        
        
    }

    @objc func clickGetAddress()  {
        let view = PickerView()
        UIApplication.shared.keyWindow?.addSubview(view)
    }
    
    @objc func clickGetDate()  {
        
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
