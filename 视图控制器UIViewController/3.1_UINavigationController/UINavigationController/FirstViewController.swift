//
//  FirstViewController.swift
//  UINavigationController
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "第1页"  //该属性的内容将显示在顶部的导航栏中
        self.view.backgroundColor = UIColor.brown
        
        //重新创建了一个导航按钮UIBarButtonItem，并替换默认的导航栏右侧的按钮
        //每一个加到NavigationController对象的ViewController都会有一个对应的navigationItem，该对象由ViewController以lazy load懒加载的方式创建，从而使开发者可以对navigationItem中的leftBarButtonItem、rightBarButtonItem、backBarButtonItem、title以及prompt等几项属性进行设置
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.nextPage))
    }
    
    //导航控制器拥有顶部的导航栏和底部的工具(标签)栏，在默认状态下，底部的工具栏处于隐藏状态，我们可以在视图控制器的viewWillAppear方法中，在视图即将显示时，调整工具栏和导航栏的可见性
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setToolbarHidden(false, animated: false)  //第一个参数表示工具条的可见性状态，第二个参数表示是否以动态的方式切换工具条的可见性状态
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)  //将顶部的导航栏显示
        
        self.navigationItem.prompt = "正在载入..."  //当prompt属性被设置后，导航栏的高度将变为74
        
        //UIBarButtonSystemItem是枚举类型，共包含24种按钮样式
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(FirstViewController.refresh))
        
        self.navigationController?.navigationBar.isTranslucent = false  //设置导航栏的背景为不透明
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black  //设置导航栏的样式为黑色主题
        self.navigationController?.navigationBar.tintColor = UIColor.orange  //tintColor属性是view专门用来指定所包含的关键元素颜色的，导航栏两侧的按钮为橙色
    }
    
    @objc func nextPage() {
        
        //实例化SecondViewController对象，然后获得当前视图控制器的导航控制器navigationController属性，并调用该属性的pushViewController方法加载新的视图控制器
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func refresh() {
        print("刷新数据.")
    }

}
