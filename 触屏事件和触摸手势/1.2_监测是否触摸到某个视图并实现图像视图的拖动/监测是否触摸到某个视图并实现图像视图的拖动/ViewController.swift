//
//  ViewController.swift
//  监测是否触摸到某个视图并实现图像视图的拖动
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var isTouchInImageView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //当用户点击某个视图时，可以通过UITouch类获得点击事件在视图中的位置，然后通过判断该位置是否在视图的frame区域中，从而判断用户是否点击了某个视图
        let image = UIImage(named: "Star")
        self.imageView = UIImageView(image: image)
        
        self.view.addSubview(self.imageView)
    }
    
    //用来监测用户是否按下手指
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first  //获得一个UITouch对象
        let touchPoint = touch?.location(in: self.view)  //获得在当前视图控制器根视图中的位置
        
        let imageViewFrame = self.imageView.frame
        let minX = imageViewFrame.origin.x
        let minY = imageViewFrame.origin.y
        let maxX = minX + imageViewFrame.size.width
        let maxY = minY + imageViewFrame.size.height
        
        //判断用户是否点击了图像视图
        if (touchPoint?.x)! >= minX && (touchPoint?.x)! <= maxX && (touchPoint?.y)! >= minY && (touchPoint?.y)! <= maxY {
            
            isTouchInImageView = true
            print("您捡到一枚星星")
        }
    }
    
    //
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //判断用户是否在图像视图中按下手指
        if !isTouchInImageView {
            return
        }
        
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)  //获得用户当前的触摸位置
        let touchPrePoint = touch?.previousLocation(in: self.view)  //获得上一个移动位置
        
        //偏移距离
        let disX = (touchPoint?.x)! - (touchPrePoint?.x)!
        let disY = (touchPoint?.y)! - (touchPrePoint?.y)!
        
        var centerPoint = self.imageView.center
        centerPoint.x += disX
        centerPoint.y += disY
        
        self.imageView.center = centerPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchInImageView = false
    }

}


