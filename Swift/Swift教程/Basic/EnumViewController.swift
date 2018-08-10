//
//  EnumViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/9.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class EnumViewController: UIViewController {

    enum SomeEnumeration {
        
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    // 原始值
    enum ASCIIControlCharacter : Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    //原始值的隐式赋值
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }

    //递归枚举
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "枚举"
        self.view.backgroundColor = UIColor.white
        
        var directPoint = CompassPoint.east
        
        directPoint = .north
        
        print(directPoint)
        
        print(Planet.neptune.rawValue,Planet.neptune.hashValue)
        
        let position = 11
        
        if let somePlant = Planet(rawValue: position) {
            switch somePlant {
            case .earth :
                print("earth")
            case .mars  :
                print("mars")
            default :
                print("not a safe for humans")
            }
        } else{
            print("There is not a plant at position 11")
        }
        
        //递归枚举
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
