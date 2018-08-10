//
//  Swift_BasicVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/4.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Swift_BasicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //整数与浮点数转换
        let a : Int = 3
        let b : Double = 0.7415926
        let pi = Double(a) + b
        print(pi)
        
        let c = Int(pi) //省略小数部分
        print(c)
        
        //元组 : 元组内的值可以为如何类型，不需一定相同类型
        
        let tuples = (1,"abc")
        print(tuples.0,tuples.1)
        
        // 注意：
       // Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
        
        //断言
        
      //  let num  = -3
      //  assert(num > 0,"error")
        
        
        //区间运算符
        
        1...5  //闭区间
        1..<5  //半开区间
        
        
        //   单侧区间  [2...]    [...2]  [..>2]
        
        let arr = ["1","2","3","4","5","6"]
        
        for i in arr[2...] {          //数组 从3到结尾
            print(i)                   //    [...2]  从开头到3
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
