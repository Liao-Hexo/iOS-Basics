//
//  ViewController.swift
//  CALayer边框
//
//  Created by 廖家龙 on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIView是iOS系统中界面元素的基础，所有的界面元素都继承自它，它本身完全是由CoreAnimation来实现的
        //而UIView真正的绘图部分是由一个叫CALayer(Core Animation Layer)的类来管理的
        //UIView本身更像是一个CALayer的管理器，访问它跟绘图和坐标有关的属性，例如frame、bounds等，实际上都是在内部访问它所包含的CALayer的相关属性
        
        let view = UIView(frame: CGRect(x: 60, y: 60, width: 200, height: 200))
        view.backgroundColor = UIColor.black
        
        view.layer.borderWidth = 20  //设置层的边缘宽度borderWidth为20
        
        view.layer.borderColor = UIColor.lightGray.cgColor  //设置层的边缘颜色的值为浅灰色
        //这里使用的是CGColorRef数据类型，而不是UIColor，因为UIColor是定义在UIKit框架中的，只能在iOS中使用，而CALayer是定义在QuartzCore框架中的，所以需要使用具有跨平台特性的CGColorRef数据类型
        
        self.view.addSubview(view)
    }
}

