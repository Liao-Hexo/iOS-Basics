//
//  ViewController.swift
//  UIView的外观属性
//
//  Created by 廖家龙 on 2021/7/5.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //窗口和UIView视图是为iOS应用程序构造用户界面的可视化组件。窗口为内容显示提供背景平台，而UIView视图负责绝大部分的内容描画，并负责响应用户的交互。
        //UIView之所以能够显示，完全是因为其内部的CALayer层对象。UIView真正的绘图部分由一个CALayer类来管理，其本身更像是一个CALayer的管理器，访问它跟绘图和坐标有关的属性，例如frame、bounds等，实际上内部都是在访问它所包含的CALayer的相关属性。通过操作这个CALayer对象可以很方便的调整UIView的一些界面属性，比如阴影、圆角大小、边框宽度和颜色等
        //和桌面macOS的应用程序有所不同，iOS应用程序通常只有一个窗口，表示为一个UIWindow类的实例。应用程序在启动时创建这个窗口，并往窗口中加入一个或多个视图，然后将它显示出来。窗口一旦显示出来，你基本上就不会再使用到它了，而更多的是对UIView视图的操作。
        //在iOS应用程序中，窗口对象并没有关闭框或者标题栏这样的区域，所以用户不能直接对其进行关闭或其他操作
        //在macOS中，NSWindow的父类是NSResponder。而在iOS系统中，UIWindow的父类是UIView。因此，UIWindow窗口在iOS系统中也是一个视图对象
        //尽管iOS支持多个窗口的存在，但是最好不要创建多个窗口，比如当你希望在内容上方显示警告窗口时，可以使用UIKit提供的警告视图控制器UIAlertController，而不应该再创建新的窗口。
        
        /*
        UIView类的外观属性常用的主要有：
        1. 背景颜色：backgroundColor
        2. 切边：clipsToBounds
        3. 透明度：alpha
        4. 显示与隐藏：hidden
        */
        
        let view = UIView(frame: CGRect(x: 40, y: 80, width: 240, height: 240))
        
        //设置视图的backgroundColor背景颜色属性为黑色
        view.backgroundColor = UIColor.black
        
        /* 将一张图片作为视图的背景颜色
         let view = UIView(frame: CGRect(x: 40, y: 80, width: 240, height: 240))
         let image = UIImage(named: "logo")  //通过UIImage对象加载资源文件夹中的一张图片
         view.backgroundColor = UIColor.init(patternImage: image!)  //使用UIColor类的init方法将加载的图片作为图案平铺在视图的背景中
         self.view.addSubview(view)
        */
        
        //显示器是由一个个像素点组成的，每个像素点都可以显示一个由RGBA颜色空间组成的颜色值，其中的A就表示透明度alpha
        //UIView中的alpha属性是一个浮点值，取值范围在0～1.0，表示从完全透明到完全不透明
        //alpha属性的默认值为1
        view.alpha = 0.3  //透明度
        //当把alpha的值设置成0以后：当前的UIView及其子视图都会被隐藏，而不管子视图的alpha值为多少；当前的UIView会从响应者链中移除，而响应者链中的下一个会成为第一响应者
        
        view.isHidden = false  //表示UIView视图是否处于隐藏的状态，其默认值为false
        //当把值设为true时，当前的UIView及其子视图都会被隐藏，而不管子视图的hidden值为多少；当前的UIView会从响应者链中移除，而响应者链中的下一个会成为第一响应者
        
        //切边属性clipsToBounds
        let subView = UIView(frame: CGRect(x: 40, y: 40, width: 240, height: 240))
        subView.backgroundColor = UIColor.green
        view.addSubview(subView)
        
        view.clipsToBounds = true  //在默认情况下，当向一个视图中添加一个子视图时，如果子视图的区域超出了父视图的范围，子视图超出的部分仍然会在屏幕上正常显示；如果需要限制子视图的显示范围不超过父视图的显示区域，就需要设置父视图的clipsToBounds属性
        
        //通过addSubView()方法将视图添加到当前视图控制器的根视图中
        self.view.addSubview(view)
    }
    
}

