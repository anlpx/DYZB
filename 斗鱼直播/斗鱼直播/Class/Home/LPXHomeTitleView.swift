//
//  LPXHomeTitleView.swift
//  斗鱼直播
//
//  Created by 卢鹏肖 on 2017/3/21.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

import UIKit

import SnapKit

class LPXHomeTitleView: UIView {

    var titleLable = UILabel()
    
    var scrollView = UIScrollView()
    
    var bottomView = UIView()
    
    var baseScrollView = UIView()
    
    var titlesArr = ["推荐","游戏","娱乐","趣玩"]
    
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        
        self.scrollView = UIScrollView(frame: self.bounds)
        self.baseScrollView = UIView(frame: scrollView.bounds)
        self.baseScrollView.backgroundColor = UIColor.red
        
        self.addSubview(scrollView)
        self.scrollView.addSubview(self.baseScrollView)
        
        self.scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.top.equalTo(self)
        }
        self.baseScrollView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.top.equalTo(self.scrollView)
        }
        
        let arrCount = self.titlesArr.count
        let screenSize = UIScreen.main.bounds.size
        let count = CGFloat(arrCount)
        for i in 0..<arrCount {
            self.titleLable = UILabel()
            
            let b = CGFloat(i)
            
            self.titleLable.frame = CGRect(x: screenSize.width / count * b + 1, y: 0, width: screenSize.width / count, height: 29)
            self.titleLable.text = self.titlesArr[i]
            self.titleLable.textAlignment = NSTextAlignment.center
            self.titleLable.font = UIFont.systemFont(ofSize: 14)
            self.baseScrollView.addSubview(self.titleLable)
            
        }
        self.bottomView = UIView(frame: CGRect(x: 0, y: 29, width: screenSize.width / count, height: 1))
        self.bottomView.backgroundColor = UIColor.orange
        self.baseScrollView.addSubview(self.bottomView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
