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
    var headerView : UIView?
    var label : UILabel?
    var button : UIButton?
    var backImage : UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildNavi()
        buildTableView()
        createHeaderView()
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
        //创建旋转动画
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        //旋转角度
        animation.toValue = 2.0 * Double.pi
        
        //旋转角度需要的时间
        animation.duration = 5
        
        //旋转重发次数
        animation.repeatCount = MAXFLOAT
        
        //动画执行完后不移除
        animation.isRemovedOnCompletion = true
        
        //累加旋转角度
        animation.isCumulative = true
        
        //将动画添加到视图的layer上
        image?.layer.add(animation, forKey: "rotationAnimation")
        
        //取消动画
       // view.layer.removeAllAnimations()
        
//        UIView.animate(withDuration: 5) {
//            self.image?.transform = (self.image?.transform.rotated(by: CGFloat(Double.pi)))!
//        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! ProgressCell
       // cell.backgroundColor = .red
        //cell.textLabel?.text = "来试一下啊!"
       // cell.progressView?.progressBackColor = UIColor.gray
       // cell.progressView?.progressViewColor = UIColor.red
       // cell.progressView?.progressValue = 0.8
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        //print((image?.frame.origin.y)! - scrollView.contentOffset.y)
        
        var imageX = image?.frame.origin.x
       // imageX = scrollView.contentOffset.y
       // image?.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
       label?.center.y = 155.0 + scrollView.contentOffset.y
        print(label?.frame as Any)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension Project08_AnimationOfVpnVC {
    
    func buildNavi()  {
        let leftItem = UIBarButtonItem(image: "火.png", highLightImage: "火(1)", size: CGSize(width: 40, height: 40))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func buildTableView()  {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight), style: UITableViewStyle.plain)
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        // self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.register(ProgressCell.classForCoder(), forCellReuseIdentifier: "progressCell")
    }
    //创建头部视图
    func createHeaderView() {
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: 240))
        
        backImage = UIImageView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: 240))
        backImage?.image = UIImage(named: "timg.jpg")
        
        headerView?.backgroundColor = UIColor(red: 98/255.0, green: 197/255.0, blue: 248/255.0, alpha: 1.0)
        //图片
        image = UIImageView(image: UIImage.init(named: "123.jpg"))
        headerView?.addSubview(image!)
        image!.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerView!)
            make.top.equalTo(headerView!).offset(50)
            make.height.width.equalTo(80)
        }
        image!.layer.masksToBounds = true
        image!.layer.cornerRadius = 40;
        
        
        
        
        label = UILabel()
        headerView?.addSubview(label!)
        label?.text = "SwiftSwift"
        label?.textColor = UIColor.white
        label?.textAlignment = NSTextAlignment.center
        label?.snp.makeConstraints { (make) in
            make.top.equalTo(image!.snp.bottom).offset(10)
            make.centerX.equalTo(image!)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        button = UIButton.init(type: UIButtonType.system)
        button?.setTitle("连接", for: UIControlState.normal)
        button?.backgroundColor = UIColor.white
        button?.titleLabel?.textColor = UIColor.blue
        button?.layer.masksToBounds = true
        button?.layer.cornerRadius = 5
        headerView?.addSubview(button!)
        button?.snp.makeConstraints { (make) in
            make.top.equalTo(label!.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalTo(image!)
        }
        
        startAnimation()
        self.tableView?.tableHeaderView = headerView
    }
}



