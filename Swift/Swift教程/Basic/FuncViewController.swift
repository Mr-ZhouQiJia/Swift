//
//  FuncViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/6.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class FuncViewController: UIViewController {
    var x = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "函数"
        self.view.backgroundColor = UIColor.white
        
        let string  = func1()
        print(string)
        
        let a  = func2(name: "Timer", age: 10)
        let b = func2(name: "timo", age: 60)
        print(a,b)
        
        func3(string: "aaa")
        
        let c =  minMax(a: 10, b: 20)
        print(c)
        
       print(greet(person: "wo", from: "qwer"))
        
     //   greet222(person: <#T##String#>, hometown: <#T##String#>)
        
        //闭包
        
        //  sorted方法
        //  Swift 标准库提供了名为 sorted(by:) 的方法，它会根据你所提供的用于排序的闭包函数将已知类型数组中的值进行排序。一旦排序完成，sorted(by:) 方法会返回一个与原数组大小相同，包含同类型元素且元素已正确排序的新数组。原数组不会被 sorted(by:) 方法修改。
        
        let names = ["adas","sdad","fdsd","retrrf","asd"]
        
        //方法1
        func backward(_ s1 : String , _ s2 : String) -> Bool {
            return s1 > s2
        }
        
        var reversedNames = names.sorted(by: backward)
        print(reversedNames)
        
        //方法2
        reversedNames = names.sorted(by: { (s1 : String, s2 : String) -> Bool in
            return  s1 < s2
            })
        print(reversedNames)
        
        
        //方法3
        names.sorted(by: >)
        
        
        //逃逸闭包
        
        
        func doSomething() {
            someFunctionWithNonescapingClosure {
                self.x = 100
            }
            
            
        }
        
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // 打印出 "5"
        
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customerProvider)
        print(customersInLine.count)
        // 打印出 "5"
        
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        // 打印出 "4"

        
        
        
        
    }
    
    func someFunctionWithNonescapingClosure(closure : () -> Void)  {
        closure()
    }
    
    
    //无参函数
    func func1() -> String {
        return "hello , world"
    }
    
    //多参函数
    func func2(name : String , age : Int) -> String {
        if age > 30 {
            return  "\(name) is old"
        }else{
            return  "\(name) is younger"
        }
    }
    
    //无返函数
    func func3(string : String) {
        print("func3")
    }
    
    //多返回值函数
    func minMax(a : Int , b : Int) -> (min :Int , max : Int) {
        
        return  a > b ? (b , a ) : (a , b)
        
    }
    
    // 可选元组返回类型函数
    // 如果函数返回的元组类型有可能整个元组都“没有值”，你可以使用可选的（ optional ） 元组返回类型反映整个元组可以是nil的事实。你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组，例如 (Int, Int)? 或 (String, Int, Bool)?
    
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    func greet(person : String , from hometown : String) -> String {
        return "Hello \(person)! Glad you could visit from \(hometown)."
    }
    
    func greet222(person : String , hometown : String) -> String {
        return "Hello \(person)! Glad you could visit from \(hometown)."
    }
    
    
    
  //  忽略参数标签
    
  //  如果你不希望为某个参数添加一个标签，可以使用一个下划线(_)来代替一个明确的参数标签。
    
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
        // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    }
   // someFunction(1, secondParameterName: 2)

    
    
    
    
    

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
