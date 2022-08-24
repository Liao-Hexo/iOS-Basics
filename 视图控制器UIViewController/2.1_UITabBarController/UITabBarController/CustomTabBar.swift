//
//  CustomTabBar.swift
//  UITabBarController
//
//  Created by 廖家龙 on 2021/12/15.
//

import UIKit

class CustomTabBar: UITabBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let oneItem: UITabBarItem = UITabBarItem.init(title: "test1", image: UIImage.init(named: "Tab1"), tag: 0)
        let twoItem: UITabBarItem = UITabBarItem.init(title: "test2", image: UIImage.init(named: "Tab2"), tag: 1)
        let threeItem: UITabBarItem = UITabBarItem.init(title: "test3", image: UIImage.init(named: "Tab3"), tag: 2)
        
        self.items = [oneItem, twoItem, threeItem]
        self.selectedItem = oneItem
        
        twoItem.badgeValue = "8"  //在Tab图标上显示角标
        
        self.backgroundImage = UIImage.init()
        self.shadowImage = UIImage.init()
        
        self.backgroundColor = .black
        self.tintColor = .systemOrange
        self.barTintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
