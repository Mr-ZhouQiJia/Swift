//
//  AppDelegate.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/2.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit
import CoreData


@available(iOS 9.0, *)
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate,JPUSHRegisterDelegate {
    
    
    let appKey = "a77828004ee25605b6cad6ca"
    let channel = "appStore"
    
    var window: UIWindow?
    var view : UIView?
    let tabar = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print(AppHeight,AppWidth)
        
        let title : Array = ["Swift学习","SwiftDemo","其它"]
        let selectedImage = ["study_selected","app_selected","other_selected"]
        let unselectedImage = ["study_unselected","app_unselected","other_unselected"]
        
    
        
        for index in 1...3 {
            //  使用NSClassFromString时，需要在类名前加上项目名称
            let vc = "Swift教程." + "Swift_ViewController\(index)"
            
            let vcClass = NSClassFromString(vc) as! UIViewController.Type
            
            let viewController = vcClass.self.init()

            let navi = BaseNavigationController(rootViewController: viewController)
            navi.navigationBar.isTranslucent = false
            navi.tabBarItem.title = title[index - 1]
            
            var image = UIImage(named: selectedImage[index - 1])
            image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            navi.tabBarItem.selectedImage = image
            var unselectedImage  = UIImage(named: unselectedImage[index - 1])
            unselectedImage = unselectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            navi.tabBarItem.image = unselectedImage
            
            navi.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.red], for: UIControlState.selected)
            
            tabar.addChildViewController(navi)
            
        }
        
        tabar.tabBar.isTranslucent = false
        self.window?.rootViewController = tabar

        
        
        
        
        //3D-Touch

        let icon1 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.home)
        let homeItem = UIApplicationShortcutItem(type: "home", localizedTitle: "首页", localizedSubtitle: nil, icon: icon1, userInfo: nil)
        
        let icon2 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.audio)
        let item2 = UIApplicationShortcutItem(type: "appList", localizedTitle: "appList", localizedSubtitle: nil, icon: icon2, userInfo: nil)
        
        let icon3 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.audio)
        let item3 = UIApplicationShortcutItem(type: "news", localizedTitle: "新闻", localizedSubtitle: nil, icon: icon3, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [homeItem,item2,item3]
        
        //MARK:- 集成极光推送
        jPushSet(launchOptions: launchOptions)
        
        //MARK:- 集成友盟分享
        configUSharePlatforms()

        return true
    }

   
     //MARK:- 集成极光推送
    func jPushSet(launchOptions : [UIApplicationLaunchOptionsKey: Any]? )  {
        let entity =  JPUSHRegisterEntity()
        entity.types = Int(JPAuthorizationOptions.alert.rawValue) | Int(Float(JPAuthorizationOptions.alert.rawValue)) | Int(Float(JPAuthorizationOptions.sound.rawValue))
        JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self)
        
        let advertisingID = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        JPUSHService.setup(withOption: launchOptions, appKey: appKey, channel: channel, apsForProduction: false , advertisingIdentifier: advertisingID)
        
        
    }
    
    //获取屏幕上显示的viewcontroller
    
    func getCurrentVC() -> UIViewController {
        var result : UIViewController? = nil
        
        if self.window?.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.shared.windows
            for window in windows{
                
                if window.windowLevel == UIWindowLevelNormal {
                    self.window = window
                    break
                }
                
            }
            
        }
        
        let frontView = self.window?.subviews.last
        let nextRrsponder = frontView?.next
        if (nextRrsponder?.isKind(of: UIViewController.self))! {
            result = (nextRrsponder as! UIViewController)
        }else{
            result = self.window?.rootViewController
        }
        
        return result!
        
    }
    
    //截取当前屏幕的图片
    func snapshot(view : UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
        
    }
  
    func applicationWillResignActive(_ application: UIApplication) {
       
        view = UIView.init(frame: UIScreen.main.bounds)
        
        let imageV = UIImageView.init(frame: UIScreen.main.bounds)
        
        //获取当前视图控制器
        let vc = getCurrentVC()
        //获取当前视图为图片
        imageV.image = snapshot(view: vc.view)
        //添加毛玻璃效果
        let blur : UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let effectview : UIVisualEffectView = UIVisualEffectView.init(effect: blur)
        effectview.frame = UIScreen.main.bounds
        imageV.addSubview(effectview)
        view?.tag = 1111
        view?.addSubview(imageV)
        self.window?.addSubview(view!)
        
        
        
        
        
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

        


    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        if view?.tag == 1111 {
            view?.alpha = 0
            view?.removeFromSuperview()
        }

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Swift教程")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    @available(iOS 9.0, *)
    func  application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        guard let tabBar = self.window?.rootViewController as? UITabBarController else {
            return
        }
        
        switch shortcutItem.type {
        case "home":
            tabBar.selectedIndex = 1
        case "news":
            let newsVC = Project05_AlamofireVC()
            newsVC.hidesBottomBarWhenPushed = true
           tabBar.selectedIndex = 1
    tabBar.selectedViewController?.childViewControllers.first?.navigationController?.pushViewController(newsVC, animated: false)
        default:
            tabBar.selectedIndex = 2
        }
        
        
        
    }
    
    //MARK:- JPUSHDelegate
    // 接受推送通知(前台)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        
        let userInfo = notification.request.content.userInfo
        print("前台:\(userInfo)")
        if notification.request.trigger is UNPushNotificationTrigger {
            JPUSHService.handleRemoteNotification(userInfo)
        }
        // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
        completionHandler(Int(UNNotificationPresentationOptions.alert.rawValue)|Int(UNNotificationPresentationOptions.badge.rawValue) )
        
      
    }
    
    // 接受推送通知(后台)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        let userInfo = response.notification.request.content.userInfo
        print("后台:\(userInfo)")
        if response.notification.request.trigger is UNPushNotificationTrigger {
            JPUSHService.handleRemoteNotification(userInfo)
        }
        // 系统要求执行这个方法
        completionHandler()
        receiveRemotePush(userInfo: userInfo as! Dictionary<String , Any>)
        
    }
    
    //注册apns成功接口
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JPUSHService.registerDeviceToken(deviceToken)
    }
    
    //注册apns失败调用方法
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    //收到通知
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        JPUSHService.handleRemoteNotification(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
        
        print(userInfo)
        
    }
    
    //接收推送处理
    func receiveRemotePush(userInfo :Dictionary<String, Any>  )  {
        print(userInfo)
        let action = userInfo["action"] as! String
        let url = userInfo["url"] as! String
        
        if action == "1" {
            let navi = self.getRootViewController()
            let vc = RemotePushWebVCViewController()
            vc.url = url as NSString
            navi.pushViewController(vc, animated: true)
            
        } else if action == "2"{
            
        }else if action == "3" {
            
        }
        
        
    }
    
    //获取当前页面的控制器
    func getRootViewController() -> UINavigationController {

        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if (rootViewController?.isKind(of: UITabBarController.self))! {
            let firstController = tabar.selectedViewController
            if (firstController?.isKind(of: UINavigationController.self))!{
                return firstController as! BaseNavigationController
            }else{
                return UINavigationController(rootViewController: firstController!)
            }
            
        }else if ( rootViewController?.isKind(of: UINavigationController.self))!{
            return rootViewController as! BaseNavigationController
        }

        return UINavigationController(rootViewController:rootViewController!)
    }
    
    //MARK:- 集成分享
    func configUSharePlatforms()  {
        
        UMConfigure.initWithAppkey("5bad9f3ff1f556df51000287", channel: "app store")
        UMSocialManager.default()?.setPlaform(.wechatSession, appKey: "", appSecret: "", redirectURL:" http://mobile.umeng.com/social")
        UMSocialManager.default()?.setPlaform(.QQ, appKey: "1107874064", appSecret: "6fo3dqJQpRCNeg98", redirectURL:" http://mobile.umeng.com/social")
        UMSocialManager.default()?.setPlaform(.sina, appKey: "3560192699", appSecret: "74ffbf0b3b9a150dfb9da37fda90bd19", redirectURL:" http://mobile.umeng.com/social")
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        let result = UMSocialManager.default()?.handleOpen(url)
        if  !result! {
            
        }
        return result!
        
    }
}

