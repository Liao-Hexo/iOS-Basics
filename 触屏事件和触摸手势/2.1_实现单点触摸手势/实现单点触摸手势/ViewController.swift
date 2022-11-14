//
//  ViewController.swift
//  实现单点触摸手势
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UIGestureRecognizer类对用户常用的手势操作进行了识别：UIPanGestureRecognizer拖动手势、UIPinchGestureRecognizer捏合手势、UIRotationGestureRecognizer旋转手势、UITapGestureRecognizer点击手势、UILongPressGestureRecognizer长按手势、UISwipeGestureRecognizer轻扫手势
        //UIGestureRecognizer手势分为discrete gestures非连续手势和continuous gestures连续手势两种，UITapGestureRecognizer属于非连续类型的手势，其他5种手势则属于连续类型的手势
        
        //实现单点触摸手势
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "lock")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true  //使图像视图可以接收用户的交互动作
        
        self.view.addSubview(self.imageView)
        
        let guesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.singleTap))
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func singleTap()
    {
        let image = UIImage(named: "unlock")
        imageView.image = image
    }
    
}

