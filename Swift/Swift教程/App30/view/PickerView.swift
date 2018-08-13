//
//  PickerView.swift
//  Swift教程
//
//  Created by ddsc on 2018/8/10.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class PickerView: UIView,UIPickerViewDataSource,UIPickerViewDelegate{
    
    
    
    var pickerView : UIPickerView?
    
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.frame = CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight)
        
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: AppHeight - 300, width: AppWidth, height: 300))
        self.addSubview(self.pickerView!)
        
        
        
        
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
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "123"
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return  100
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
