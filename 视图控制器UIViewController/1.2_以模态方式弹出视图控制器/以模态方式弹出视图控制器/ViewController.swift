//
//  ViewController.swift
//  以模态方式弹出视图控制器
//
//  Created by 廖家龙 on 2021/7/8.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!  //该标签用来显示从模态窗口中返回的数据

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //以模态方式弹出视图控制器并传参：创建一个新的视图控制器，并以模态的方式显示新的视图控制器，同时向新的视图控制器中传递数据
        //在ViewController.swift中添加一个按钮，当用户点击按钮时，以模态的方式弹出另一个视图控制器，同时向该视图控制器中传入参数
        
        self.view.backgroundColor = UIColor.brown
        
        label = UILabel(frame: CGRect(x: 40, y: 100, width: 240, height: 44))
        label.text = ""
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 44))
        button.setTitle("打开新的视图控制器", for: .normal)
        button.backgroundColor = UIColor.black
        
        //给按钮绑定了点击事件，当用户点击该按钮时，将调用相应的方法
        button.addTarget(self, action: #selector(self.openViewController), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    @objc func openViewController() {
        
        let newViewController = NewViewController()
        newViewController.labelTxt = "传递的参数!"
        
        //设置viewController属性为当前的视图控制器，该属性将被用来从模态视图控制器向当前的视图控制器中返回数据
        newViewController.viewController = self
        
        self.present(newViewController, animated: true, completion: nil)  //以模态的方式显示新的视图控制器，第一个参数表示需要打开的视图控制器实例，第二个参数表示是否以动画的方式打开视图控制器，第三个参数表示视图控制器被打开后的回调方法
    }

}
