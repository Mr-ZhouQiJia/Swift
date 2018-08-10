//
//  InheritViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/11.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit


struct Bus {
    var type : String!
    var brand : String!
    init(type : String , brand : String ) {
        self.type = type
        self.brand = brand
    }
    
    var num = 100_00
    
    
}


class InheritViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "继承"
        self.view.backgroundColor = UIColor.white
        
        let person = Person()
        person.name = "timo"
        person.age   = 12
        person.eat(food: "西瓜")
        let student = Student()
        student.name = "asssa"
        student.num = "123"
        student.study()
        student.eat(food: "苹果")
        
        print(student.decription)
        let littleStu = LittleStu()
        littleStu.num = "12131231231"
        print(littleStu.decription)
        
        //构造过程
        
        var car = Bus(type: "卡车", brand: "奔驰")
        car.brand = "宝马"
        print(car.num)
       // var per = Person(name: <#T##String#>, age: <#T##Int#>)
        
       // print(per)
    }

    
    class Person {
        var name : String?
        var age : Int?
        init(name : String , age : Int) {
            self.age = age
            self.name = name
        }
        convenience init() {
            self.init(name: "[Unnamed]", age: 11)
        }
        
        var description : String {
            return "123"
        }
      /*
        init(name : String , age : Int) {
            self.name = name
            self.age = age
        }
       */
        
        func eat(food : String!) {
            print("\(String(describing: name!))  eat \(food!)")
        }
    }
    
    // 防止重写
    
   // 你可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。
    
    
    class Student: Person {
     final   var  num : String?
        
        var decription : String {
            return "num +  \(num!)"
        }
        
        
        func study()  {
            print("study")
        }
        
    }
    
    class LittleStu: Student {
        override var decription: String {
            return "little  + num  + \(num!)"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //析构过程
    //Swift 会自动释放不再需要的实例以释放资源。如自动引用计数章节中所讲述，Swift 通过自动引用计数（ARC）处理实例的内存管理。通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前手动去关闭该文件。
    deinit {
       print("iloveu")
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
