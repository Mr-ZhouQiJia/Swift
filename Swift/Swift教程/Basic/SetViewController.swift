//
//  SetViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/6.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "集合类型"
        self.view.backgroundColor = UIColor.white
        
        if #available(iOS 8, *) {
            print("ios 10")
        }else{
            print("anther")
        }

        let a = Person(name: "jim", age: "25")
        print(a.age!)
        
        let b = Person.init(name: "tom", age: "12")
        print(b.name!)
        
        let c = Adlut()
      //  print(c.job! as Any)
        
        let d = Adlut.init(name: "Ais", age: "25")
     //   print(d.job!)
        
        
        
    }

    class Person {
        var name : String?
        var age : String?
        
        required  init(name : String , age : String) {
            self.name = name
            self.age = age
        }
        
        convenience init() {
            self.init(name: "allen", age: "123")
        }
        
    }
    
    class Adlut: Person {
        
        var job : String?
        /*
        init(name : String , age : String , job : String) {
            self.job = job
            super.init(name: name, age: age)
        }
        
        override convenience init(name: String, age: String) {
            self.init(name: name, age: age, job: "teacher")
        }
        */
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    deinit {
        
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
