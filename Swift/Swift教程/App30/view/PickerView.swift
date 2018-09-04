//
//  PickerView.swift
//  Swift教程
//
//  Created by ddsc on 2018/8/10.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class PickerView: UIView,UIPickerViewDataSource,UIPickerViewDelegate{
    
    var provinceArray : Array<Any> = Array()
    var cityArray : Array<Any> = Array()
    var areaArray : Array<Any> = Array()
    
    var pickerView : UIPickerView?
    var bgView : UIView?
    
    var provinceIndex : Int?
    var cityIndex : Int?
    var areaIndex : Int?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        
        self.bgView = UIView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight))
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.frame = CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight)
        
        
        self.addSubview(self.bgView!)
        
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: AppHeight - 240, width: AppWidth, height: 240))
        self.pickerView?.backgroundColor = UIColor.white
        self.pickerView?.dataSource = self
        self.pickerView?.delegate = self
        self.bgView?.addSubview(self.pickerView!)
        
        getData()
        
    }
    
    func getData()  {
        
        
        
        let allArray = NSArray(contentsOfFile: Bundle.main.path(forResource: "area", ofType: "plist")!) 
        
//
//        for dic : Dictionary<String , AnyObject> in allArray {
//
//            self.provinceArray.append(dic.keys.first!)
//        }
//        
        
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let point:CGPoint = (touches.first?.location(in: self))!
        
        if self.frame.contains(point)  {
            self.removeFromSuperview()
        }
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return (self.provinceArray.count)
        case 1:
            return self.cityArray.count
        default:
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return  AppWidth / 3 - 9
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            provinceIndex = row
            cityIndex = 0
            areaIndex = 0
        case 1:
            cityIndex = row
            areaIndex = 0
        default:
            areaIndex = row
        }
        
        
        
        
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: AppWidth / 3 - 9, height: 30))
        switch component {
        case 0:
            label.text = (self.provinceArray[row] as! String)
        case 1:
            label.text = self.areaArray[row] as? String
        default:
            label.text = "123"
        }
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = NSTextAlignment.center
        return label
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
