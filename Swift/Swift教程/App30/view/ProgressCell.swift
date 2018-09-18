//
//  ProgressCell.swift
//  Swift教程
//
//  Created by ddsc on 2018/9/6.
//  Copyright © 2018年 ddsc. All rights reserved.
//

import UIKit

class ProgressCell: UITableViewCell {

    /**
     
     */
    var progressView : ProgressView?
    
    var titleLabel : UILabel?
    
    var progressValue : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        progressView = ProgressView()
        self.contentView.addSubview(progressView!)
        progressView?.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        progressView?.bottonView?.backgroundColor = UIColor.red
        titleLabel = UILabel()
        self.contentView.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(16)
            make.centerY.equalTo(self.progressView!)
            make.height.equalTo(30)
            make.right.equalTo(self.progressView!.snp.left).offset(-10)
        }
        
        progressValue = UILabel()
        self.contentView.addSubview(progressValue!)
        progressValue?.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel!.snp.bottom).offset(20)
            make.left.equalTo(self.contentView).offset(16)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
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
