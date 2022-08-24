//
//  ViewController.swift
//  创建一个视图控制器
//
//  Created by 廖家龙 on 2021/7/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIViewController视图控制器、UITabBarController标签控制器、UINavigationController导航控制器
        
        //UIViewController（视图控制器）在MVC设计模式中扮演着控制层（C）的角色，UIViewController的职责对内管理与之关联的View，对外跟其他UIViewController通信和协调，一个视图控制器管理一个根视图，其他视图都放置在根视图中，其view属性指向它所管理的根视图
        
        self.view.backgroundColor = UIColor.green  //更改视图控制器根视图的背景颜色为绿色
        
        //新建一个视图控制器
        //New File -> Cocoa Touch Class
        //在创建的窗口中，在Class输入框内输入NewViewController，在subClass of输入框内输入UIViewController，作为新建类的父类
        
        //修改默认视图控制器：在Storyboard中修改视图控制器对应的类文件
    }

}

