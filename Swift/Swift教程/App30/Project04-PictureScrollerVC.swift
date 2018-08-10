//
//  Project04-PictureScrollerVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/24.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project04_PictureScrollerVC: UIViewController {

    var picture : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        self.picture = UIImageView.init(frame: CGRect(x: 10, y: 10, width: AppWidth - 20, height: AppHeight - 20))
        
        
        
        
        
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
