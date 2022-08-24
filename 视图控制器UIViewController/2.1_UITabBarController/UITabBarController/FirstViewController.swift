//
//  FirstViewController.swift
//  UITabBarController
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.brown
        
        let label = UILabel(frame: CGRect(x: 40, y: 150, width: 240, height: 44))
        label.text = "第一页"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Arial", size: 36)
        
        //当用户点击该按钮时，跳转到UITabBarController实例中的第二个界面
        let button = UIButton(frame: CGRect(x: 40, y: 220, width: 240, height: 44))
        button.setTitle("进入第二页", for: UIControl.State())
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(self.enterPage2), for: .touchUpInside)
        self.view.addSubview(button)
        
        self.view.addSubview(label)
    }
    
    //当用户点击按钮时，首先通过tabBarController属性获得当前视图控制器所属的tabBarController，然后设置tabBarController对象的selectedIndex属性的值为1，即可进入tabBarController中的第二个界面
    @objc func enterPage2() {
        self.tabBarController?.selectedIndex = 1
    }

}
