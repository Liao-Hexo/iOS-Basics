//
//  ViewController.swift
//  位移关键帧动画的制作
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //位移关键帧动画的制作
        //Core Animation是一组非常强大的动画处理API，使用它能做出非常绚丽的动画效果，但是Core Animation的动画只是从一个数值渐变到另一个数值，只能应付一些比较简单的动画场景，这种直线式的动画无法实现复杂的动画效果，这时我们就可以使用CAKeyFrameAnimation类进行关键帧动画的制作
        //CAKeyFrameAnimation原理：通过对某个属性设置一组不同的数值，然后由系统自动生成相邻数值之间的线性过渡帧
        
        let imageView = UIImageView(frame: CGRect(x: 40, y: 80, width: 64, height: 64))
        imageView.image = UIImage(named: "star")
        self.view.addSubview(imageView)
        
        let animation = CAKeyframeAnimation(keyPath: "position")  //通过指定keyPath，可以对图像视图CALayer层的该属性进行更改，从而使图像视图产生位置变化的动画效果
        
        let point1 = CGPoint(x: 40, y: 80)
        let point2 = CGPoint(x: 280, y: 80)
        let point3 = CGPoint(x: 60, y: 300)
        let point4 = CGPoint(x: 280, y: 300)
        
        //values属性用来设置整个位移动画过程中的关键位置
        animation.values = [NSValue(cgPoint: point1),
                            NSValue(cgPoint: point2),
                            NSValue(cgPoint: point3),
                            NSValue(cgPoint: point4)]
        
        animation.keyTimes = [NSNumber(value: 0.0),
                              NSNumber(value: 0.4),
                              NSNumber(value: 0.6),
                              NSNumber(value: 1.0)]
        
        animation.delegate = self
        
        animation.duration = 5.0
        
        imageView.layer.add(animation, forKey: "Move")  //将动画添加到图像视图的层中，以实现动画的播放
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        print("The animation starts")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("End of the animation")
    }
    
}


