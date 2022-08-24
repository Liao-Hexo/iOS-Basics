//
//  ViewController.swift
//  UIView的变形操作
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIView的变形操作：平移、旋转、缩放、斜切
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.center = self.view.center  //将视图的center属性设置为与当前视图控制器根视图的center相同的位置
        view.backgroundColor = UIColor.black
        self.view.addSubview(view)
        
        /*
         
        //平移仿射变换
        let transform = view.transform  //transform表示现有矩阵
        view.transform = transform.translatedBy(x: 0, y: 100)  //垂直方向上将视图的矩阵向下平移了100

        //缩放仿射变换
        //对矩阵的缩放操作本质上是拉长或缩短原来矩阵中的点与点之间的距离
        view.transform = transform.scaledBy(x: 1.5, y: 1.5)

        //旋转仿射变换
        //参数angle表示在顺时针方向上旋转的角度，顺时针旋转45度
        view.transform = transform.rotated(by: 3.14/4)
         
        */
        
        //斜切仿射变换
        //在水平和垂直方向上进行斜切操作
        view.transform.b = 0.5
        view.transform.c = 0.5
        
        //保持缩放比例不变
        view.transform.a = 1.0
        view.transform.d = 1.0
        
        //在水平和垂直方向上不进行平移
        view.transform.tx = 0.0
        view.transform.ty = 0.0
        
    }
    
}

