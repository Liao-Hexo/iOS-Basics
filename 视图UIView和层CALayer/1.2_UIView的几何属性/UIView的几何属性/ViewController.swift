//
//  ViewController.swift
//  UIView的几何属性
//
//  Created by 廖家龙 on 2021/7/5.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //iOS系统包含两个坐标系，其中UIKit坐标系是X轴正方向向右，Y轴正方向向下，而标准的Quartz 2D绘图坐标系为X轴正方向向右，Y轴正方向向上
        
        //UIView的frame(origin,size)属性：定义了一个矩形区域，描述一个UIView的大小和在父坐标系的位置
        
        //UIView的bounds(origin,size)属性：
        //同样定义了一个矩形区域，描述一个UIView的大小和自身坐标系原点的位置，bounds.origin属性默认值是(0,0)，而bounds.size和frame.size是一致的
        
        //UIView的center属性：用于确定一个视图的中心点位置，参照系也是其父视图的坐标系统，在对视图进行放大、缩小或旋转时，该属性的值不会改变
        
        let frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.black
        
        //view.bounds = CGRect(x: -50, y: -50, width: 250, height: 250)
        view.bounds = CGRect(x: -50, y: -50, width: 200, height: 200)
        
        //view.center = CGPoint(x: 200, y: 200)
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        subView.backgroundColor = UIColor.green
        view.addSubview(subView)
        
        self.view.addSubview(view)
    }
    
}

