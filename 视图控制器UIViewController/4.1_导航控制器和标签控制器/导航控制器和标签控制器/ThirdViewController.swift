//
//  ThirdViewController.swift
//  导航控制器和标签控制器
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        self.title = "第三页"
        self.tabBarItem.image = UIImage(named: "Tab3")
    }

}
