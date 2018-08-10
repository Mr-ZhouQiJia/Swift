//
//  BaseNavigationController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/23.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.white
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white , NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20)]
        
    
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
