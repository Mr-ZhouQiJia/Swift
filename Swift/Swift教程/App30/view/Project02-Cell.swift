//
//  Project02-Cell.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/20.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project02_Cell: UITableViewCell {

    var label : UILabel?
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.label = UILabel()
        self.contentView.addSubview(label!)
        label?.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
