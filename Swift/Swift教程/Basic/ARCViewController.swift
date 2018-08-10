//
//  ARCViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/13.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class ARCViewController: UIViewController {

    
    //弱引用
    
    //弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用。
    
    //无主引用
    
    //  和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用在其他实例有相同或者更长的生命周期时使用。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用。
    
    //  无主引用通常都被期望拥有值。不过 ARC 无法在实例被销毁后将无主引用设为nil，因为非可选类型的变量不允许被赋值为nil。
    
    
    
    var person : Person?
    var apartment : Aparment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "自动引用计数"
        self.view.backgroundColor = UIColor.white
        
        person = Person(name: "Critiano Ronaldo")
        apartment = Aparment(unit: "UNIT 45")
    
        
        person!.apartment = apartment
        apartment!.person = person
        
      //  person = nil
     //   apartment = nil
        
    }

    class Person {
        
        let name : String
        init(name : String) {
            self.name = name
        }
        
        var apartment : Aparment?
        deinit {
            print("person \(name) is being deinitialized")
        }
        
        
    }
    
    class Aparment {
        let unit : String
        init(unit : String) {
            self.unit = unit
        }
        
       weak var person : Person?
        deinit {
            print("apartment \(unit) is being deinitialized")
        }
        
        
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
