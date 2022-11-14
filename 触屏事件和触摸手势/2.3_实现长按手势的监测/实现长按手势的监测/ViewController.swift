//
//  ViewController.swift
//  实现长按手势的监测
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //实现长按手势的监测
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "lock")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true  //使图像视图可以接收用户的交互动作
        
        self.view.addSubview(self.imageView)
        
        let guesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_ :)))
        guesture.minimumPressDuration = 1.0  //只有当手指按下并持续1秒钟之后，才会被识别为长按手势
        guesture.allowableMovement = 20.0  //在手指处于按下状态时，若手势移动的距离超过20点，则视为非长按手势，此属性的默认值为10
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func longPress(_ gusture: UILongPressGestureRecognizer)
    {
        if gusture.state == UIGestureRecognizer.State.began{
            
            let image = UIImage(named: "unlock")
            imageView.image = image
        }
    }
    
}

