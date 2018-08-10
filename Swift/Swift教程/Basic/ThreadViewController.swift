//
//  ThreadViewController.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/24.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
      //  thread()
        
        GCD()
    }

    //MARK: - 1.Thread
    func thread()  {
        
        //1.1  使用类方法创建,自动运行
        Thread.detachNewThread {
            print(Thread.current)
        }
        Thread.detachNewThreadSelector(#selector(eat(food:)), toTarget: self, with: nil)
        
        //1.2 使用构造方法初始化.需手动运行
        let thread = Thread {
            print(Thread.current)
        }
        thread.name = "线程520"
        //启动线程
        thread.start()
        
        //线程退出
        //Thread.exit()
        
        //休眠
        Thread.sleep(forTimeInterval: 10)
        
        //取消
       // thread.cancel()
        
        
    }
    
   @objc func eat(food : String)  {
    print(Thread.current)
    Thread.sleep(forTimeInterval: 5)
        print("eat \(food)")
    }
    
    //MARK: GCD
    func GCD()  {
        
        // 🌹主队列
        let mainQueue = DispatchQueue.main
        // 在主队列中执行同步任务会造成线程死锁
        /*
        mainQueue.sync {
            print("我是主队列")
        }
        */
        
        mainQueue.async {
            print("我是主线程 \(Thread.current)")
        }
        
        // 🌹全局队列
        let globalQueue = DispatchQueue.global()
        // 全局队列的同步任务  在主线程执行    🌹不会创建新线程
        globalQueue.sync {
            Thread.sleep(forTimeInterval: 4)
            print("我是全局队列de同步任务 : \(Thread.current)")
        }
        // 全局队列的异步任务  随机分配  创建新线程
        for i in 1...10{
        globalQueue.async {
            print("我是全局队列的异步任务 \(i) : \(Thread.current)")
            }
        }
        
        
        
        
        
        
        
       //1.自己创建一个队列
        
        /*
         第一个参数代表队列的名称，可以任意起名
         第二个参数代表队列属于串行还是并行执行任务
         串行队列一次只执行一个任务。一般用于按顺序同步访问，但我们可以创建任意数量的串行队列，各个串行队列之间是并发的。
         并行队列的执行顺序与其加入队列的顺序相同。可以并发执行多个任务，但是执行完成的顺序是随机的。
         */
        
        //1.1   创建一个串行队列
        let queue = DispatchQueue(label: "serialQueue1")
        for i in 1...10{
        queue.sync {
            print("我是串行队列的同步任务 \(i): \(Thread.current)")
        }
        }
        
        
        //1.2   创建并行队列
        
        /**
         参数说明：
         
         label 表示队列标签
         
        ⚠️ qos 表示设置队列的优先级
         .userInteractive 需要用户交互的，优先级最高，和主线程一样
         .userInitiated 即将需要，用户期望优先级，优先级高比较高
         .default 默认优先级
         .utility 需要执行一段时间后，再通知用户，优先级低
         *.background 后台执行的，优先级比较低
         *.unspecified 不指定优先级，最低
         
         ⚠️attributes 表示队列类型，默认为串行队列，设置为.concurrent表示并行队列。iOS 10.0之后 attributes 新增.initiallyInactive属性表示当前队列是不活跃的，它需要调用DispatchQueue的activate方法来执行任务。
         
         ⚠️autoreleaseFrequency 表示自动释放频率，设置自动释放机制。
         .inherit 表示不确定，之前默认的行为也是现在的默认值
         .workItem 表示为每个执行的项目创建和排除自动释放池, 项目完成时清理临时对象
         .never 表示GCD不为您管理自动释放池
         */
        let concurrent = DispatchQueue(label: "concurrentQueue1", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target : nil)
        
        for i in 1...10 {
            concurrent.async {
                print("我是并行队列的异步任务  \(i): \(Thread.current)")
            }
        }
        
        //   ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️同步任务不开辟新线程
        for i in 1...10 {
            concurrent.sync {
                print("我是并行队列的同步任务 \(i) : \(Thread.current)")
            }
        }
        
        //MARK:- 1.3😡😡😡😡😡😡😡😡任务组
        
        let group = DispatchGroup()
        
        let globalQueue1 = DispatchQueue.global()
        
        globalQueue1.async(group: group) {
            sleep(2)
        print("block1")
        }
        
        globalQueue1.async(group:group) {
            sleep(5)
            print("block2")
        }
        
        globalQueue1.async(group : group) {
            print("block3")
        }
        
        //1.4暂停一个队列
        globalQueue1.suspend()
        sleep(1)
        print("暂停结束")
        globalQueue1.resume()
        
        globalQueue1.async(group: group){
            print("block4")
        }
        //2,永久等待，直到所有任务执行结束，中途不能取消，阻塞当前线程
        group.wait()
        group.notify(queue: globalQueue1) {
            print("任务执行完毕")
        }
        
        //  1.5只执行一次
        // 在Swift3中，dispatch_once被废弃了，我们要替换成其他全局或者静态变量和常量.
        
        
        //1.6 延迟调用
        
     //   DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 4) {
       //     print("延迟4秒")
        //}
        
        // 如果需要取消正在等待执行的Block操作，我们可以先将这个Block封装到DispatchWorkItem对象中，然后对其发送cancle，来取消一个正在等待执行的block。
        let task = DispatchWorkItem {
            print("workitem")
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: task)
        task.cancel()
        
        /*
         1.7，信号，信号量
         DispatchSemaphore(value: )：用于创建信号量，可以指定初始化信号量计数值，这里我们默认1.
         semaphore.wait()：会判断信号量，如果为1，则往下执行。如果是0，则等待。
         semaphore.signal()：代表运行结束，信号量加1，有等待的任务这个时候才会继续执行。
         */
        
        let queue2 = DispatchQueue(label: "myQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit)
       // for i in 1...10 {
         //   queue2.async {
            //    print("\(i)")
           // }
        //}
        
        //使用信号量保证正确性
        let semaphore = DispatchSemaphore(value: 1)
        for i in 10...20 {
            queue2.async {
                // //永久等待，直到Dispatch Semaphore的计数值 >= 1
                semaphore.wait()
                sleep(2)
                print("\(i)")
                //发信号，使原来的信号计数值+1
                semaphore.signal()
            }
        }
        
        
        
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
