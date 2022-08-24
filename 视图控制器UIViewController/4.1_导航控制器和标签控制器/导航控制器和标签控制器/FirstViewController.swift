//
//  FirstViewController.swift
//  导航控制器和标签控制器
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.brown
        self.title = "第一页"
        self.tabBarItem.image = UIImage(named: "Tab1")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.nextPage))
    }
    
    @objc func nextPage() {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
