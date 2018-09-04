//
//  Project08-AnimationOfVpnVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/8/30.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project08_AnimationOfVpnVC: BaseViewController , UITableViewDelegate , UITableViewDataSource {

    var tableView : UITableView?
    var image : UIImageView?
    var angle = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight), style: UITableViewStyle.plain)
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        createHeaderView()
    }

    //创建头部视图
    func createHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: 200))
        headerView.backgroundColor = UIColor(red: 98/255.0, green: 197/255.0, blue: 248/255.0, alpha: 1.0)
        //图片
        image = UIImageView(image: UIImage.init(named: "123.jpg"))
        headerView.addSubview(image!)
        image!.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerView)
            make.top.equalTo(headerView).offset(50)
            make.height.width.equalTo(60)
        }
        image!.layer.masksToBounds = true
        image!.layer.cornerRadius = 30;
        
        
        
        
        let label = UILabel()
        headerView.addSubview(label)
        label.text = "SwiftSwiftSwift"
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.snp.makeConstraints { (make) in
            make.top.equalTo(image!.snp.bottom).offset(10)
            make.centerX.equalTo(image!)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        let button = UIButton.init(type: UIButtonType.custom)
        button.setTitle("连接", for: UIControlState.normal)
       // button.backgroundColor = UIColor.white
        button.titleLabel?.textColor = UIColor.red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        headerView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.centerX.equalTo(image!)
        }
        
        startAnimation()
        
        
        
        
        
        
        
        self.tableView?.tableHeaderView = headerView
    }
    
    func startAnimation()  {
//         print(self.angle)
//        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.repeat, animations: {
//
//            //指定旋转角度 360, Double.pi为180度
//            self.image!.transform = CGAffineTransform.identity.rotated(by: CGFloat(self.angle * (Double.pi / 180.0)))
//        }) { (_) in
//            self.angle += 50
//            print(self.angle)
//            self.startAnimation()
//        }
        let animation = <#value#>
        


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "来试一下啊!"
        
        return cell
        
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
