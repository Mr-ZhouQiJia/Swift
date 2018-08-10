//
//  Swift_ViewController1.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/3.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Swift_ViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView : UITableView!
    var dataArray : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift基础"
        tableView = UITableView(frame: UIScreen.main.bounds)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.dataArray = ["1.常量和变量",
                          "字符串和字符",
                          "集合类型",
                          "函数",
                          "枚举",
                          "类和结构体",
                          "继承",
                          "自动引用计数",
                          "多线程"
                        ]
        let view = UIView()
        
        self.tableView.tableFooterView = view
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.dataArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)) as UITableViewCell
        
        cell.textLabel?.text = self.dataArray[indexPath.row] as! String
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc : Swift_BasicVC = Swift_BasicVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1 :
            let vc = StringAndCharVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2  :
            let vc = SetViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3  :
            let vc = FuncViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4  :
            let vc = EnumViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5  :
            let vc = ClassAndStructViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6  :
            let vc = InheritViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 7  :
            let vc = ARCViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 8  :
            let vc = ThreadViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
            
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
