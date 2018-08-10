//
//  StringAndCharVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/5.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class StringAndCharVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "字符串和字符"
        
        //     字符串是值类型
        
        //字符串字面量
        let string  = "qwerrrrrr"
        
        //转义字符    \" \\   \0   \'
        let a = "\"1122333fsfds\""
        
        //空字符串
        
        var emptyString = ""
        var anthorEmptyString = String()
        
        let dog = "dog!!!🐩"
        // 遍历字符串
        for char in dog {
            print(char)
        }
        
        //将字符数组转为字符串
        let catChar : [Character] = ["l","o","v","e"]
        
        let love = String(catChar)
        print(love)
        
        // 字符串拼接
        // 1. +
        let  stringA = "I"
        let stringB = " LOVE"
        var stringC = stringA + stringB
        print(stringC)
        
        // 2.  apend()方法
        
        let stringD = " U"
        stringC.append(stringD)
        print(stringC)
        
        var word = "cafe"
        word += "\u{301}" //拼接一个重音，u+0301
        print(word)
        
        //字符串索引
        /*
         使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。
         
         通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。您还可以通过调用 index(_:offsetBy:) 方法来获取对应偏移量的索引，这种方式可以避免多次调用 index(before:) 或 index(after:) 方法。
        */
        
        
        
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        // a
        
        //试图获取越界索引对应的 Character，将引发一个运行时错误。
       // greeting[greeting.endIndex] // error
       // greeting.index(after: endIndex) // error
        
        //  插入 删除
        
        //调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符，调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。
        
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)  //插入单个字符
        print(welcome)
        
        //插入字符串
        welcome.insert(contentsOf: " world", at: welcome.index(before: welcome.endIndex))
        print(welcome)
        
        // 调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串。
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        print(welcome)
        
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        
        welcome.removeSubrange(range)
        print(welcome)
        
        
        
        
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
