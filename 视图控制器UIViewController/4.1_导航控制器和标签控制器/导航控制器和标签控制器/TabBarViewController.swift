//
//  TabBarViewController.swift
//  导航控制器和标签控制器
//
//  Created by 廖家龙 on 2021/12/15.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //在开发iOS应用时，经常将UINavigationController导航控制器和UITabBarController标签控制器相结合来创建一个应用程序的框架
        
        let firstViewControler = FirstViewController()
        let navigationController = UINavigationController(rootViewController: firstViewControler)
        
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        
        self.viewControllers = [navigationController, secondViewController, thirdViewController]
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
