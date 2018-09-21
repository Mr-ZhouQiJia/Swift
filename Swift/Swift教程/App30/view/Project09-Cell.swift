//
//  Project09-Cell.swift
//  Swift教程
//
//  Created by ddsc on 2018/9/19.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project09_Cell: UICollectionViewCell {

    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    var clickBlock : (()->())?
    
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        
        clickBlock?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        
        
    }

}
