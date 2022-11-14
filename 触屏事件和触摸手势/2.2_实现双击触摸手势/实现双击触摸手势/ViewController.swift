//
//  ViewController.swift
//  实现双击触摸手势
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //实现双击触摸手势
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "lock")
        imageView.image = image
        
        imageView.isUserInteractionEnabled = true  //使图像视图可以接收用户的交互动作
        
        self.view.addSubview(self.imageView)
        
        let guesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.doubleTap))
        guesture.numberOfTapsRequired = 2  //识别进行两次点击的手势，该属性的默认值为1
        guesture.numberOfTouchesRequired = 1  //识别一根手指进行两次点击的手势，该属性的默认值也是1
        imageView.addGestureRecognizer(guesture)
    }
    
    @objc func doubleTap()
    {
        let image = UIImage(named: "unlock")
        imageView.image = image
    }
    
}

