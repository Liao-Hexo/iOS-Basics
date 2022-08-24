//
//  TabBarViewController.swift
//  UITabBarController
//
//  Created by 廖家龙 on 2021/12/14.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UITabBarController通常作为整个程序的rootViewController，而且不能添加到别的视图控制器中，UITabBarController主要用来管理用户提供的包含各种内容的子视图控制器，而每一个子视图控制器则负责管理自己的视图层级关系
        
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()

        self.viewControllers = [firstViewController, secondViewController, thirdViewController]
        
        //自定义tabBar添加之前必须先添加viewControllers，否则自定义tabBar无效
        let customTabBar: CustomTabBar = CustomTabBar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        customTabBar.delegate = self
        self.tabBar.addSubview(customTabBar)
        
        self.tabBar.backgroundColor = .black
    }
    
    //UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.selectedIndex = item.tag
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
