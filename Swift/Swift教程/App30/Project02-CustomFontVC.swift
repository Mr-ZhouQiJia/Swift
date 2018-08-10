//
//  Project02-CustomFontVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/20.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project02_CustomFontVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView?
    var changeFont : UIButton?
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight - 300), style: UITableViewStyle.plain)
        self.view.addSubview(tableView!)
       // self.tableView?.backgroundColor = UIColor.black
        
        changeFont = UIButton()
        changeFont?.setTitle("changeFont", for: UIControlState.normal)
        changeFont?.layer.masksToBounds = true
        changeFont?.layer.cornerRadius = 50
        changeFont?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        changeFont?.backgroundColor = UIColor.yellow
        changeFont?.setTitleColor(UIColor.black, for: UIControlState.normal)
        changeFont?.addTarget(self, action: #selector(changeAFont), for: UIControlEvents.touchUpInside)
        self.view.addSubview(changeFont!)
        changeFont?.snp.makeConstraints { (make) in
            make.top.equalTo((tableView?.snp.bottom)!).offset(-50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        tableView?.register(Project02_Cell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView?.tableFooterView = UIView()
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
    }

    @objc func changeAFont()  {
       fontRowIndex = (fontRowIndex + 1)%5
        print(fontNames[fontRowIndex])
       self.tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Project02_Cell
        cell.label?.text = data[indexPath.row]
        cell.label?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        
        return cell
        
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
