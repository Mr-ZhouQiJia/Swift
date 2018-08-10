//
//  ClassAndStructViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/9.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

struct Resolution {
    var width = 0
    var height = 0
    
}

class VeidoDemo {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}
var aaaa = "aaaa"

class ClassAndStructViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "类和结构体"
        self.view.backgroundColor = UIColor.white

        let resolution =  Resolution.init(width: 10, height: 10)
        print(resolution.height)
        
        let vedioDemo : VeidoDemo = VeidoDemo()
        
        vedioDemo.name = "TIMO"
        
        vedioDemo.resolution.height = 200
        
        
        
        //在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。
        /*
         *
         *在将resolution赋予给cinema的时候，实际上是将resolution中所存储的值进行拷贝，然后将拷贝的数据存储到新的cinema实例中。结果就是两个完全独立的实例碰巧包含有相同的数值。由于两者相互独立，因此将cinema的width修改为2048并不会影响hd中的width的值。
         */
        var cinema = resolution
        
        cinema.height = 500
        
        print(cinema.height , resolution.height) // 500 . 10
        
        //结构体和枚举是值类型    类是引用类型
        
        
        
        // 运用这两个运算符检测两个常量或者变量是否引用同一个实例：
        //等价于（===）
        //不等价于（!==）

        /*
         按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
         
         该数据结构的主要目的是用来封装少量相关简单数据值。
         有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
         该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
         该数据结构不需要去继承另一个既有类型的属性或者行为。
         
         举例来说，以下情境中适合使用结构体：
         
         几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
         一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
         三维坐标系内一点，封装x，y和z属性，三者均为Double类型。

         
         常量结构体的存储属性
         
         如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行：
         
         let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
         // 该区间表示整数0，1，2，3
         rangeOfFourItems.firstValue = 6
         // 尽管 firstValue 是个变量属性，这里还是会报错
         
         因为 rangeOfFourItems 被声明成了常量（用 let 关键字），即使 firstValue 是一个变量属性，也无法再修改它了。
         
         这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
         
         属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。
         

         
         
         */
         let manager = DataManager()
        manager.data.append("Some data")
        print(manager.data)
        manager.data.append("Some more data")
        print(manager.data)
        
        
        
        
    }

    class DataImpoter {
        var fileName = "data.txt"
        
    }
    
    class DataManager {
        lazy var importer = DataImpoter()
        var data = [String]()
        var center :DataImpoter{
            get {
              return DataImpoter()
            }
            
            set{
                
            }
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
