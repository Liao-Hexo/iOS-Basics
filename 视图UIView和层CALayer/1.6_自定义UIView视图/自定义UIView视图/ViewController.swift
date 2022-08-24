//
//  ViewController.swift
//  自定义UIView视图
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用自定义视图可以很方便的复用一些复杂或不规则的视图对象
        let view = RoundView(frame: CGRect(x: 40, y: 40, width: 240, height: 140))
        //view.color = UIColor.green
        
        self.view.addSubview(view)
    }
}

