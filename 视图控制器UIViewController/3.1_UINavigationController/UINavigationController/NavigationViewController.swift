//
//  NavigationViewController.swift
//  UINavigationController
//
//  Created by 廖家龙 on 2021/12/15.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UINavigationController与UITabBarController的主要区别：UINavigationController是作为栈来实现的，它更适合用于处理和显示分层的数据
        
        let viewController = FirstViewController()
        self.viewControllers = [viewController]
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
