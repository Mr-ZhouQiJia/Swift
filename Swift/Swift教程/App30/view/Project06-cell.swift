//
//  Project06-cell.swift
//  Swift教程
//
//  Created by ddsc on 2018/7/30.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class Project06_cell: BaseTableViewCell {

    var title : UILabel?
    var author : UILabel?
    var pic : UIImageView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.title = UILabel()
        self.author = UILabel()
        self.pic = UIImageView()
        
        self.contentView.addSubview(self.title!)
        self.contentView.addSubview(author!)
        self.contentView.addSubview(pic!)
        self.title?.numberOfLines = 0
        
        
        self.buildUI()
    }
    
    func buildUI(){
        
        self.title?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.contentView).offset(15)
            make.top.equalTo(self.contentView).offset(5)
            make.right.equalTo(self.pic!.snp.left).offset(10)
            
            make.height.equalTo(50)
            
            
            
        })
        
        self.pic!.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-15)
            make.top.equalTo(self.contentView).offset(5)
            make.bottom.equalTo(self.contentView).offset(-15)
            make.width.equalTo(80)
        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
