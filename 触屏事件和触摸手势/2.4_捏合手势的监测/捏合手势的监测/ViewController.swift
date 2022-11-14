//
//  ViewController.swift
//  捏合手势的监测
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //捏合手势的监测
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "Hand")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true  //使图像视图可以接收用户的交互动作
        
        self.view.addSubview(self.imageView)
        
        //当两个手指按下并移到一定距离时，会被识别为一个Pinch捏合手势，此时捏合手势处于begins状态。接着只要其中一个手指继续移动，捏合手势将进入changes状态，当两个手指都松开时，捏合手势将处于ends状态
        let guesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchImage(_ :)))
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func pinchImage(_ recognizer: UIPinchGestureRecognizer) {
        
        //通过recognizer对象的view属性可以获得包含捏合手势的视图对象，然后通过recognizer对象的scale属性的值更改view对象的transform属性，从而实现图像视图的缩放功能
        recognizer.view?.transform = (recognizer.view?.transform.scaledBy(x: recognizer.scale, y: recognizer.scale))!
        
        recognizer.scale = 1  //使捏合手势的缩放比例始终在1倍的基础上进行递增或递减
        
        //recognizer.velocity  表示在进行缩放动作时的速度
    }
    
}

