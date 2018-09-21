//
//  Project09-BlockDemoVC.swift
//  Swift教程
//
//  Created by ddsc on 2018/9/19.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project09_BlockDemoVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.buildUI()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Project09-Cell", for: indexPath) as! Project09_Cell
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1.0)
        cell.clickBlock = { () in
            print("点我\(indexPath.row,indexPath.section )")
            self.navigationController?.pushViewController(Project08_AnimationOfVpnVC() as UIViewController, animated: true)
        }
        return cell
    }
   

}

extension Project09_BlockDemoVC {
    
    func buildUI()  {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 132, height: 145)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 50, 10, 50)
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        self.view.addSubview(self.collectionView!)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(UINib(nibName: "Project09-Cell", bundle: nil), forCellWithReuseIdentifier: "Project09-Cell")
        self.collectionView?.backgroundColor = UIColor.white
    }
    
    
}

