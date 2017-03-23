//
//  LPXMainTabBarViewController.swift
//  斗鱼直播
//
//  Created by 卢鹏肖 on 2017/3/19.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

import UIKit

class LPXMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = UIView(frame: self.tabBar.bounds)
        view.backgroundColor = UIColor.white
        self.tabBar.insertSubview(view, at: 0)
        
        self.setChildViewController(viewController: LPXHomeViewController(), title: "主页", normImage: "btn_home_normal", selectedImage: "btn_home_selected")
        
        self.setChildViewController(viewController: LPXLiveViewController(), title: "直播", normImage: "btn_column_normal", selectedImage: "btn_column_selected")
        
        self.setChildViewController(viewController: LPXAttentionViewController(), title: "关注", normImage: "btn_live_normal", selectedImage: "btn_live_selected")
        
        self.setChildViewController(viewController: LPXMyViewController(), title: "我的", normImage: "btn_user_normal", selectedImage: "btn_user_selected")
        
        self.selectedIndex = 0
    }
    
    // 初始化控制器
    func setChildViewController(viewController : UIViewController, title : String,normImage : String,selectedImage : String) {
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 119 / 255.0, green: 119 / 255.0, blue: 119 / 255.0, alpha: 1)], for: UIControlState.normal)
        
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 199 / 255.0, green: 101 / 255.0, blue: 28 / 255.0, alpha: 1)], for: UIControlState.selected)
        
        viewController.tabBarItem .image = UIImage(named: normImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let nav = LPXMainNAVViewController(rootViewController: viewController)
        self .addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
