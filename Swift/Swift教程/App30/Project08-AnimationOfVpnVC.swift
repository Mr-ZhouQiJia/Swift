//
//  Project08-AnimationOfVpnVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/8/30.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class Project08_AnimationOfVpnVC: BaseViewController , UITableViewDelegate , UITableViewDataSource {

    var tableView : UITableView?
    var image : UIImageView?
    var angle = 0.0
    var label : UILabel?
    var button : UIButton?
    var backImage : UIImageView?
    var offset : CGFloat = 0
    var sunView : UIImageView?
    var isLoad : Bool = false
    var timer : Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildNavi()
        buildTableView()
        createHeaderView()
        
        let 多行字符 = """
        我们一起学猪叫
        一起哈哈哈哈哈
        """
        print(多行字符)
        
    }
    
    func startAnimation()  {
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
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! ProgressCell
       // cell.backgroundColor = .red
        //cell.textLabel?.text = "来试一下啊!"
        cell.progressView?.progressBackColor = UIColor.gray
        cell.progressView?.progressViewColor = UIColor.red
        cell.progressView?.progressValue = 0.8
        cell.titleLabel?.text = "进度:"
        cell.progressValue?.text = "80%"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isLoad {
            self.tableView?.contentOffset =  CGPoint.init(x: 0, y: -240 - 120)
        }

        let offset = scrollView.contentOffset.y
        var frame = self.backImage?.frame
        print("\(self.offset) + \(offset)")
        if self.offset > offset  {
            print("向下")
            
            let x = self.offset - offset
            frame = CGRect(x: -x/2, y: -x/2, width: self.view.frame.size.width +  x , height: 240 + x  )
            self.backImage?.frame = frame!
            self.sunView?.alpha = (-offset - 240) * 2 / 240.0
            
        }else if self.offset == 0{
            return
        }else{
            print("向上")
            
         let y =   offset - self.offset
         frame = CGRect(x: 0, y: -y, width: AppWidth, height: 240)
            self.backImage?.frame = frame!
        }
        
        
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y <= -360 {
            self.isLoad = true
            self.sunView?.alpha = 1.0
            self.tableView?.isScrollEnabled = false
            self.sunRotation()
        }
    }
    
    //太阳旋转动画
    func sunRotation()  {
        
        //创建计数器
        
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (timer) in
            
        //创建旋转动画
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        //旋转角度
        animation.toValue = 2.0 * Double.pi
        
        //旋转角度需要的时间
        animation.duration = 1.0
        
        //旋转重发次数
        animation.repeatCount = MAXFLOAT
        
        //动画执行完后不移除
        animation.isRemovedOnCompletion = true
        
        //累加旋转角度
        animation.isCumulative = true
        
        //将动画添加到视图的layer上
            self.sunView?.layer.add(animation, forKey: "rotationAnimation")
        }
        timer?.fire()
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 4) {
           self.cancleSunRotation()
        }
        
    }
    
    func cancleSunRotation()  {
        timer?.invalidate()
        self.isLoad = false
        DispatchQueue.main.async {
            self.tableView?.isScrollEnabled = true
        }
        
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
        self.tableView = UITableView(frame: CGRect(x: 0, y: 64, width: AppWidth, height: AppHeight), style: UITableViewStyle.plain)
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        // self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.register(ProgressCell.classForCoder(), forCellReuseIdentifier: "progressCell")
        self.tableView?.contentInset = UIEdgeInsetsMake(240, 0, 0, 0)
        self.offset = (self.tableView?.contentOffset.y)!
    }
    //创建头部视图
    func createHeaderView() {
        backImage = UIImageView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: 240))
        backImage?.image = UIImage(named: "timg.jpg")
        //图片
        image = UIImageView(image: UIImage.init(named: "123.jpg"))
        backImage?.addSubview(image!)
        let a = 10
        image!.snp.makeConstraints { (make) in
            make.centerX.equalTo(backImage!)
            make.centerY.equalTo(backImage!)
            //make.top.equalTo(backImage!).offset(50)
            make.height.width.equalTo(80)
        }
        image!.layer.masksToBounds = true
        image!.layer.cornerRadius = 40;
        
        label = UILabel()
        backImage?.addSubview(label!)
        label?.text = "SwiftSwift"
        label?.textColor = UIColor.red
        label?.textAlignment = NSTextAlignment.center
        label?.snp.makeConstraints { (make) in
            make.top.equalTo(image!.snp.bottom).offset(5)
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
        backImage?.addSubview(button!)
        button?.snp.makeConstraints { (make) in
            make.top.equalTo(label!.snp.bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalTo(image!)
        }
        
        startAnimation()
        self.view.addSubview(backImage!)
        
        self.sunView = UIImageView(image: UIImage(named: "bg_sun"))
        self.view.addSubview(self.sunView!)
        self.sunView?.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.view).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.width.height.equalTo(30)
        }
       self.sunView?.alpha = 0.0
    }
}



