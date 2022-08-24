//
//  RoundView.swift
//  自定义UIView视图
//
//  Created by 廖家龙 on 2021/12/14.
//

import UIKit
class RoundView: UIView {
    
    var color = UIColor.blue
    
    //重写了RoundView自定义类的初始化init方法，在该初始化方法中，首先调用父类的初始化方法，然后自定义设置背景颜色为无色，从而保证RoundView只显示在drawRect方法中创建的内容
    override init(frame: CGRect) {
        
        super.init(frame:frame)
        self.backgroundColor = UIColor.clear
    }
    
    //当一个UIView需要执行绘图操作时，drawRect方法就会被调用
    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()  //获得当前的图形上下文
        
        ctx?.clear(self.frame)  //调用ctx上下文的clear方法擦除一个区域，这个函数会擦除一个矩形范围内的所有已存在的绘图内容
        ctx?.setFillColor(color.cgColor)  //设置在图形上下文中的填充颜色为当前视图属性color的颜色
        ctx?.fillEllipse(in: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))  //在当前的图形上下文中，在(0,0)位置绘制与当前视图相同尺寸的椭圆，当视图的宽度和高度相同时，绘制的图形为正圆
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
