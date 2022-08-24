//
//  ViewController.swift
//  UIView的交互属性
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let touchView = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        touchView.backgroundColor = UIColor.black
        
        //通过设置UIView的isUserInteractionEnabled属性可以激活用户的交互特性
        //当该属性的值为false时，UIView会忽略那些发生在其自身的诸如触摸和键盘等用户事件，并将这些事件从消息队列中移除出去
        //当值为true时，这些用户事件会正常派发至UIView本身，UIView会按照之前注册的事件处理方法来响应这些事件
        touchView.isUserInteractionEnabled = true
        
        self.view.addSubview(touchView)
        
        //创建了一个UITapGestureRecognizer手势对象
        let guesture = UITapGestureRecognizer(target: self, action: #selector(self.singleTap))
        //通过addGestureRecognizer方法将手势对象指定给视图对象，当用户点击该视图时，将调用手势定义的回调方法SingleTap()
        touchView.addGestureRecognizer(guesture)
        
    }
    
    @objc func singleTap() {
        print("You touched me.")
    }
    
}

