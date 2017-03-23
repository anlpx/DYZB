//
//  LPXAmusingCollectionViewCell.swift
//  斗鱼直播
//
//  Created by 卢鹏肖 on 2017/3/22.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

import UIKit

class LPXAmusingCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
