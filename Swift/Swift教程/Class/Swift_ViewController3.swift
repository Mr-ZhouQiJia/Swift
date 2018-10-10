//
//  Swift_ViewController2.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/3.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Swift_ViewController3: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var tableview : UITableView?
    var array : Array<String>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.title = "30App"
        self.tableview = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        self.tableview?.delegate = self
        self.tableview?.dataSource = self
        self.tableview?.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.view.addSubview(self.tableview!)
        self.array = ["RemotePushWebVCViewController"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.array?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview?.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell?.textLabel?.text = "123"
        
        cell?.textLabel?.text = self.array?[indexPath.row]
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //在swift中通过字符串转为类,需要在字符串名前加上项目的名称
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"]as? String // 这是获取项目的名称
        
        /**
         * 如果你的工程名字中带有“-” 符号  需要加上 replacingOccurrences(of: "-", with: "_") 这句代码把“-” 替换掉  不然还会报错 要不然系统会自动替换掉 这样就不是你原来的包名了 如果不包含“-”  这句代码 可以不加
         */
        let className = clsName! + "." + self.array![indexPath.row].replacingOccurrences(of: "-", with: "_") //拼接成字符串
        
        let viewC = NSClassFromString(className)! as! UIViewController.Type
        let vc = viewC.init() //初始化
        vc.title = self.array![indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
