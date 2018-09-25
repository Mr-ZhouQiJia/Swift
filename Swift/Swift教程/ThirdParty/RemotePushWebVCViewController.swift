//
//  RemotePushWebVCViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/9/25.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class RemotePushWebVCViewController: BaseViewController,UIWebViewDelegate {
  
    var url :  NSString?
    
    var webView : UIWebView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView = UIWebView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight))
        self.view.addSubview(self.webView!)
        if url != nil{
            self.webView?.loadRequest(URLRequest(url: URL(string: url! as String)!))
        }else{
            self.webView?.loadRequest(URLRequest(url: URL(string:"https://www.baidu.com/index.php?tn=monline_3_dg")!))
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
