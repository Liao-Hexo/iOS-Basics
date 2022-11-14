//
//  ViewController.swift
//  使用UIImageView播放桢动画
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //使用UIImageView播放桢动画
        //一个UIImageView图像视图可以存储一个动画图片序列，UIImageView图像视图对象的animationImages属性可以存储一个UIImage数据类型的图像数组
        var images = [UIImage]()
        
        for i in 1 ... 24 {
            images.append(UIImage(named: "animation\(i)")!)
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 60, width: 335, height: 253))
        imageView.animationImages = images
        
        imageView.animationDuration = 5
        imageView.animationRepeatCount = 0  //动画将进行不限次数的循环播放
        imageView.startAnimating()  //开始播放帧动画
        
        self.view.addSubview(imageView)
    }
    
}
