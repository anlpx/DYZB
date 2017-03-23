//
//  LPXHomeViewController.swift
//  斗鱼直播
//
//  Created by 卢鹏肖 on 2017/3/19.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

import UIKit

import SnapKit

class LPXHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏
        self.setNav()
        
        self.addViews()
    }

    // 设置导航栏
    func setNav() {
        let navLogoImageView = UIImageView(image: UIImage(named: "logo"))
        navLogoImageView.frame = CGRect(x: 0, y: 10, width: 69, height: 25)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navLogoImageView)
        
        let historyBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        historyBtn.setImage(UIImage(named : "image_my_history"), for: UIControlState.normal)
        historyBtn.setImage(UIImage(named : "Image_my_history_click"), for: UIControlState.selected)
        
        historyBtn.addTarget(self, action: #selector(didHistoryBtn), for: UIControlEvents.touchUpInside)
        
        
        let searchBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchBtn.setImage(UIImage(named : "btn_search"), for: UIControlState.normal)
        searchBtn.setImage(UIImage(named : "btn_search_clicked"), for: UIControlState.selected)
        searchBtn.addTarget(self, action: #selector(didClickSearchBtn), for: UIControlEvents.touchUpInside)
        
        let scanBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        scanBtn.setImage(UIImage(named : "Image_scan"), for: UIControlState.normal)
        scanBtn.setImage(UIImage(named : "Image_scan_click"), for: UIControlState.selected)
        scanBtn.addTarget(self, action: #selector(didClickScanBtn), for: UIControlEvents.touchUpInside)
        
        let historyItem = UIBarButtonItem(customView: historyBtn)
        let searchItem = UIBarButtonItem(customView: searchBtn)
        let scanItem = UIBarButtonItem(customView: scanBtn)
        
        
        self.navigationItem.rightBarButtonItems = [historyItem,searchItem,scanItem]
        
        self.edgesForExtendedLayout = []
        
        
    }

    // 添加view
    func addViews() {
        self.view.addSubview(self.titleView)
        self.titleView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(self.view)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view)
            make.top.equalTo(self.titleView.snp_bottom)
        }
    }
    
    // MARK: - 按钮事件
    func didHistoryBtn()  {
        print("点击了历史按钮")
    }
    
    func didClickSearchBtn()  {
        print("点击了搜索按钮")
    }
    
    func didClickScanBtn() {
        print("点击了扫描按钮")
    }

    // MARK: - UICollectionViewDelegate,UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPXRecommendCollectionViewCell", for: indexPath) as! LPXRecommendCollectionViewCell
            
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPXGameCollectionViewCell", for: indexPath) as! LPXGameCollectionViewCell
            
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPXRecreationCollectionViewCell", for: indexPath) as! LPXRecreationCollectionViewCell
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPXAmusingCollectionViewCell", for: indexPath) as! LPXAmusingCollectionViewCell
        
        return cell
        
    }
    
    // MARK: - 懒加载
    fileprivate lazy var titleView : LPXHomeTitleView = {
        var view = LPXHomeTitleView(frame: CGRect.zero)
//        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    fileprivate lazy var layout : UICollectionViewFlowLayout = {
        var out = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds.size
        
        out.itemSize = CGSize(width: screenSize.width, height: screenSize.height - 30)
        out.scrollDirection = UICollectionViewScrollDirection.horizontal
        out.minimumLineSpacing = 0
        out.minimumInteritemSpacing = 0
        
        return out
    }()
    
    fileprivate lazy var collectionView : UICollectionView = {
        let screenSize = UIScreen.main.bounds.size
        var view = UICollectionView(frame: CGRect(x: 0, y: 30, width: screenSize.width, height: screenSize.height - 30), collectionViewLayout: self.layout)
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.register(LPXRecommendCollectionViewCell.self, forCellWithReuseIdentifier:"LPXRecommendCollectionViewCell")
        
        
        view.register(LPXGameCollectionViewCell.self, forCellWithReuseIdentifier:"LPXGameCollectionViewCell")
        
        
        view.register(LPXRecreationCollectionViewCell.self, forCellWithReuseIdentifier:"LPXRecreationCollectionViewCell")
        
        
        view.register(LPXAmusingCollectionViewCell.self, forCellWithReuseIdentifier:"LPXAmusingCollectionViewCell")
        
        return view
    }()
}

