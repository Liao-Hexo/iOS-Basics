//
//  ViewController.swift
//  CALayer圆角
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        view.backgroundColor = UIColor.black
        
        view.layer.cornerRadius = 40  //设置层的圆角半径为40，当该属性被设置为大于0的值时，将会在层的四周绘制指定半径的圆角
        //从模拟器中的效果可以看出，虽然给黑色视图添加了圆角效果，但是由于子视图的存在，无法看到上方两个顶点的圆角效果，这是因为圆角效果只对视图的背景颜色和层的边框起作用，而不会对层中的内容起作用
        
        //view.layer.cornerRadius = 100  //设置圆角半径时，如果设置为正方形宽度的一半，那么将会创建一个正圆形
        //view.layer.cornerRadius = 200
        
        view.layer.masksToBounds = true  //不过系统提供了一个属性masksToBounds，这行代码会沿着圆角边缘对视图中的内容进行裁切
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        subView.backgroundColor = UIColor.gray
        
        view.addSubview(subView)
        self.view.addSubview(view)
    }
}

