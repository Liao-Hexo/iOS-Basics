//
//  ViewController.swift
//  对触摸事件阶段的监测
//
//  Created by 廖家龙 on 2021/7/11.
//

//在iOS中并不是所有的类都能接收并处理事件，只有继承自UIResponder类的对象才能处理触摸事件
//UIResponder是UIView的父类，常用的UIView控件、UIViewController视图控制器、UIApplication都继承自UIResponder，它们都能接收并处理触摸事件
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //UIResponder处理触屏事件的4个方法
    
    //当一个或多个手指在相关联的视图上按下时调用此方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    //当一个或多个手指在相关联的视图上滑动时调用此方法
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }
    
    //当一个或多个手指滑出相关联的视图时调用此方法
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
    //当由于系统事件的发生(比如来电、低电量通知等)而造成触摸事件被取消时调用此方法
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }

}

