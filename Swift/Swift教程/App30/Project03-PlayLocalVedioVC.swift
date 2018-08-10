//
//  Project03-PlayLocalVedioVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/20.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit
import CoreData
/*
 （1）NSManagedObjectModel(被管理的对象模型)
 
 相当于实体，不过它包含 了实体间的关系
 
 (2)NSManagedObjectContext(被管理的对象上下文)
 
 操作实际内容
 
 作用：插入数据  查询  更新  删除
 
 （3）NSPersistentStoreCoordinator(持久化存储助理)
 
 相当于数据库的连接器
 
 (4)NSFetchRequest(获取数据的请求)
 
 相当于查询语句
 
 (5)NSPredicate(相当于查询条件)
 
 (6)NSEntityDescription(实体结构)
 
 (7)后缀名为.xcdatamodel的包
 
 里面的.xcdatamodel文件，用数据模型编辑器编辑
 
 编译后为.momd或.mom文件，这就是为什么文件中没有这个东西，而我们的程序中用到这个东西而不会报错的原因。
 */


class Project03_PlayLocalVedioVC: UIViewController , UITableViewDelegate,UITableViewDataSource {

    var resultData : Array<Any>?
    var tableView : UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "通讯录"
        self.view.backgroundColor = UIColor.white
        
        //添加按钮
        let addButton : UIBarButtonItem = UIBarButtonItem(title: "添加", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addFriends))
        self.navigationItem.rightBarButtonItem = addButton
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight), style: UITableViewStyle.plain)
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
       // self.tableView?.register(UINib(nibName: "Project03-Cell", bundle: nil, forCellReuseIdentifier: "Project03-Cell")
        self.tableView?.register(UINib.init(nibName: "Project03-Cell", bundle: nil), forCellReuseIdentifier: "Project03-Cell")
        
       //self.tableView?.tableFooterView = UIView.init(frame: CGRect.zero)
        //查询数据库
        resultData =  fetchData()
        
        //MARK:-tableview滑不到底
        self.tableView?.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.resultData?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Project03-Cell", for: indexPath) as! Project03_Cell
        let a :  Friends = self.resultData![indexPath.row] as! Friends
        
        cell.imagePic.image = UIImage(data: a.image!)
        cell.phoneLB.text = a.phone
        cell.nameLB.text = a.name
        return cell
    }
    
    
    //MARK: - 添加数据
   @objc func addFriends() {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    let context = app.persistentContainer.viewContext
    
    //创建MyFriends对象
    let myFriend = NSEntityDescription.insertNewObject(forEntityName: "Friends", into: context) as! Friends
    let num = arc4random()%100
    
    myFriend.name = "蜘蛛侠" + String(num)
    let imageData = UIImagePNGRepresentation(UIImage(named: "123.jpg")!)
    myFriend.image = imageData
    myFriend.phone = "12312343244"
    
    //保存
        do {
            try context.save()
            print("添加成功")
        
        
       
        } catch  {
            print("添加失败")
        }
    
    
    DispatchQueue.main.async(execute: {
        //查询数据库
        self.resultData =  self.fetchData()
        self.tableView!.reloadData()
    })
    }
    
    
    //MARK: -查询数据
    func fetchData() -> Array<Any>  {
        //获取管理的数据上下文对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friends")
        var arr : Array<Any>?
        
      //  var _ : NSError?
        do {
            arr =   try context.fetch(request) as! [NSManagedObject]
            print(arr!.count as Any)
        } catch  {
            print("查询失败")
        }
        return arr!
    }
    
    //哪一行可以编辑
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    //删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let row = indexPath.row
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
            fetchRequest.entity = entity
            let friend = self.resultData![indexPath.row] as! Friends
            
            let predicate = NSPredicate.init(format: "name = '\(String(describing: friend.name!))'","" )
            fetchRequest.predicate = predicate
            do{
                let objects = try context.fetch(fetchRequest) as! [Friends]
                for one : Friends in objects {
                    context.delete(one)
                    appdelegate.saveContext()
                    self.resultData?.remove(at: row)
                    self.tableView?.reloadData()
                }
            
            }catch{
                let error = error as NSError
                print("失败 : \(error)")
                
            }
        }
    }
    
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let top = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "置顶") { (action, indexPath) in
            self.showAlert(message: "置顶")
            }
    
        top.backgroundColor = UIColor.gray
        
        let delete = UITableViewRowAction(style: .normal, title: "删除") { (action, indexPath) in
            let row = indexPath.row
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context)
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
            fetchRequest.entity = entity
            let friend = self.resultData![indexPath.row] as! Friends
            
            let predicate = NSPredicate.init(format: "name = '\(String(describing: friend.name!))'","" )
            fetchRequest.predicate = predicate
            do{
                let objects = try context.fetch(fetchRequest) as! [Friends]
                for one : Friends in objects {
                    context.delete(one)
                    appdelegate.saveContext()
                    self.resultData?.remove(at: row)
                    self.tableView?.reloadData()
                }
                
                self.showAlert(message: "删除成功")
            }catch{
                let error = error as NSError
                print("失败 : \(error)")
                
            }
        }
        delete.backgroundColor = UIColor.red
        
        
        let readed = UITableViewRowAction(style: .default, title: "修改") { (action, index) in
            let row = indexPath.row
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
            let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context)
            fetchRequest.entity = entity
            let per = self.resultData![row] as! Friends
            let predicate = NSPredicate(format : "name = '\(String(per.name!))'","")
            
            fetchRequest.predicate = predicate
            
            do {
                let fetchObjects = try context.fetch(fetchRequest) as! [Friends]
                for one in fetchObjects{
                    one.phone = String(arc4random()%1000000 + 100000000)
                }
                self.tableView?.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
                self.showAlert(message: "修改成功")
                print("修改成功")
            } catch{
                let nserror = error as NSError
                
                fatalError("查询失败:\(nserror) ,\(nserror.userInfo)")
            }
            
        }
        readed.backgroundColor = UIColor.orange
        
        
        
        return [delete , readed , top]
    }
    
    func showAlert(message : String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    
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
