//
//  ThirdViewController.swift
//  UITabBarController
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        
        let label = UILabel(frame: CGRect(x: 40, y: 150, width: 240, height: 44))
        label.text = "第三页"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Arial", size: 36)
        
        self.view.addSubview(label)
    }

}
