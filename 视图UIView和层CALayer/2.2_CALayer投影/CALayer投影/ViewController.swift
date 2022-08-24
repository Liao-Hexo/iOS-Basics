//
//  ViewController.swift
//  CALayer投影
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        view.backgroundColor = UIColor.black
        
        view.layer.shadowColor = UIColor.black.cgColor  //设置阴影颜色为黑色
        
        //设置阴影的偏移值，即在水平方向上向右侧偏移10，在垂直方向上向下偏移10，默认值为(0.0,-3.0)
        view.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        
        view.layer.shadowOpacity = 0.45  //设置阴影的不透明度值，默认值为0.0
        
        //设置阴影的模糊半径，用来实现阴影的模糊效果，使阴影更加柔和、自然，默认值为3.0
        view.layer.shadowRadius = 5.0
        
        self.view.addSubview(view)
    }
}

