//
//  ViewController.swift
//  UIView的嵌套和层次关系
//
//  Created by 廖家龙 on 2021/7/5.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //视图可以通过嵌套的方式组成复杂的层次结构
        
        let firstView = UIView(frame: CGRect(x: 20, y: 40, width: 200, height: 200))
        firstView.backgroundColor = UIColor.black
        
        let secondView = UIView(frame: CGRect(x: 50, y: 70, width: 200, height: 200))
        secondView.backgroundColor = UIColor.red
        
        let thirdView = UIView(frame: CGRect(x: 80, y: 100, width: 200, height: 200))
        thirdView.backgroundColor = UIColor.green
        
        self.view.addSubview(firstView)
        self.view.addSubview(secondView)
        self.view.addSubview(thirdView)
        
        //self.view.insertSubview(secondView, at: 3)  //在指定的位置上插入视图
        
        //self.view.insertSubview(thirdView, aboveSubview: firstView)  //将第三个视图插入第一个视图的上方
        //self.view.insertSubview(thirdView, belowSubview: secondView)  //将第三个视图插入第二个视图的下方
        
        //self.view.bringSubviewToFront(firstView)  //将第一个视图放置在所有子视图的上方
        
        //self.view.exchangeSubview(at: 1, withSubviewAt: 2)  //交换两个指定位置的子视图在父视图中的位置
        
        //firstView.removeFromSuperview()  //将第一个视图从其父视图中删除
    }
    
}

