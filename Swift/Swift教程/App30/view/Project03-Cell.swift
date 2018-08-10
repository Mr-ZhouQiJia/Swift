//
//  Project03-Cell.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/20.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit
/*
struct MyFriends {
    let image : UIImage
    let name : String
    let phone : String
}
*/
class Project03_Cell: UITableViewCell {

    @IBOutlet weak var imagePic: UIImageView!
    
    @IBOutlet weak var nameLB: UILabel!
    
    @IBOutlet weak var phoneLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
