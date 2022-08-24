//
//  NewViewController.swift
//  以模态方式弹出视图控制器
//
//  Created by 廖家龙 on 2021/7/8.
//
import UIKit

class NewViewController: UIViewController {
    
    weak var viewController: ViewController?  //弹出当前视图控制器的源视图控制器
    var labelTxt = ""  //表示从源视图控制器中传进来的数据

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //在该类中添加一个标签对象的属性，用来显示从前一个视图控制器传递进来的数据
        //还需要添加一个按钮对象，当用户点击该按钮时，退出当前的视图控制器，并返回原来的视图控制器，同时向原来的视图控制器返回数据
        
        self.view.backgroundColor = UIColor.purple
        
        let label = UILabel(frame: CGRect(x: 40, y: 100, width: 240, height: 44))
        label.text = labelTxt
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 44))
        button.setTitle("关闭", for: .normal)
        button.backgroundColor = UIColor.black
        
        //当用户点击按钮时，将退出当前的视图控制器，并返回源视图控制器
        button.addTarget(self, action: #selector(NewViewController.dismissSelf), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func dismissSelf() {
        
        viewController?.label.text = "返回的参数."
        self.dismiss(animated: true, completion: nil)
    }

}
