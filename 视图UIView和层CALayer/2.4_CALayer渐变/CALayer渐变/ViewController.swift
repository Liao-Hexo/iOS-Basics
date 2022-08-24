//
//  ViewController.swift
//  CALayer渐变
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CALayer和UIView相似地方是，CALayer层也可以嵌套多个子CALayer层，从而实现多种多样的效果
        
        let gradientView = UIView(frame: CGRect(x: 20, y: 60, width: 240, height: 240))
        
        //创建了一个渐变层，并设置渐变层的frame属性与视图的frame属性相同，CAGradientLayer()用来生成两种或更多颜色的平滑渐变效果
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.frame
        
        //这三个颜色将作为渐变线上的起始颜色、中间颜色、结束颜色
        let fromColor = UIColor.yellow.cgColor
        let midColor = UIColor.blue.cgColor
        let toColor = UIColor.red.cgColor
        
        gradientLayer.colors = [fromColor, midColor, toColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)  //渐变层的起始位置，即渐变线的起点位于渐变层的左上角
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)  //渐变层的终点位置，即渐变线的终点位于渐变层的右下角
        
        gradientLayer.locations = [0, 0.3, 1]  //设置了渐变层的各颜色点在颜色线中的分布情况：蓝色将位于渐变线30%的位置
        
        gradientView.layer.addSublayer(gradientLayer)
        self.view.addSubview(gradientView)
    }
}

