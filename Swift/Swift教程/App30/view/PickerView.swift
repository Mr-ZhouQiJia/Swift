//
//  PickerView.swift
//  Swift教程
//
//  Created by ddsc on 2018/8/10.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class PickerView: UIView{
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.frame = CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    /*
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    */

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let point:CGPoint = (touches.first?.location(in: self))!
        
        if self.frame.contains(point)  {
            self.removeFromSuperview()
        }
        
        
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
