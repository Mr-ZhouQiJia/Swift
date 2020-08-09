//
//  MyTableViewCell.swift
//  Swift-Test
//
//  Created by 周启佳 on 2019/8/3.
//  Copyright © 2019 zhouqijia. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var picIM: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
