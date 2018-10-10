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
        self.title = "推送直达页"
        self.webView = UIWebView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight))
        self.view.addSubview(self.webView!)
        if url != nil{
            self.webView?.loadRequest(URLRequest(url: URL(string: url! as String)!))
        }else{
            self.webView?.loadRequest(URLRequest(url: URL(string:"https://www.baidu.com/index.php?tn=monline_3_dg")!))
        }
        
        let shareBtn = UIBarButtonItem(image: UIImage(named: "分享"), style: UIBarButtonItemStyle.done, target: self, action: #selector(share))
        self.navigationItem.rightBarButtonItem = shareBtn
    }
    
    @objc func share() {
   // UMSocialUIManager.setPreDefinePlatforms([UMSocialPlatformType.QQ])
        UMSocialUIManager.showShareMenuViewInWindow { (platformType, userInfo) in
            let messageObject : UMSocialMessageObject = UMSocialMessageObject.init()
            messageObject.text = "test"
            
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
