//
//  BaseViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/23.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
        buildBackItem()
    }
    
    //创建导航栏返回按钮
    func buildBackItem()  {
        let backButton = UIButton(type: UIButtonType.custom)
        backButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        backButton.setImage(UIImage(named: "返回"), for: UIControlState.normal)
        backButton.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        let left = UIBarButtonItem(customView: backButton )
        
        //创建UIBarButtonSystemItemFixedSpace
        let spaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        //2.3将宽度设为负值
        spaceItem.width = -20
        
        self.navigationItem.leftBarButtonItems = [spaceItem,left]
        
        
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
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
