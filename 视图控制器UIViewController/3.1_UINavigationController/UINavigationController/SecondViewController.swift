//
//  SecondViewController.swift
//  UINavigationController
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

var pageNum = 1  //作为当前视图控制器的序号

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageNum = pageNum + 1  //每当SecondViewController视图控制器被创建新的实例时，将pageNum变量+1
        
        self.title = "第\(pageNum)页"
        self.view.backgroundColor = UIColor.purple
        
        //将新的视图控制器Push到导航控制器的栈中
        let push = UIButton(frame: CGRect(x: 40, y: 120, width: 240, height: 40))
        push.setTitle("Push Page", for: UIControl.State())
        push.backgroundColor = UIColor.orange
        push.addTarget(self, action: #selector(self.pushPage), for: UIControl.Event.touchUpInside)
        self.view.addSubview(push)
        
        //将位于栈顶的视图控制器从导航控制器中Pop移除
        let pop = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 40))
        pop.setTitle("Pop Page", for: UIControl.State())
        pop.backgroundColor = UIColor.orange
        pop.addTarget(self, action: #selector(self.popPage), for: UIControl.Event.touchUpInside)
        self.view.addSubview(pop)
        
        //将依次Pop位于栈顶的视图控制器，直至index所指定的位置
        let index = UIButton(frame: CGRect(x: 40, y: 280, width: 240, height: 40))
        index.setTitle("Goto Index Page", for: UIControl.State())
        index.backgroundColor = UIColor.orange
        index.addTarget(self, action: #selector(self.gotoIndexPage), for: UIControl.Event.touchUpInside)
        self.view.addSubview(index)
        
        //将Pop导航控制器堆栈中所有的视图控制器，仅保留根视图控制器
        let root = UIButton(frame: CGRect(x: 40, y: 340, width: 240, height: 40))
        root.setTitle("Goto Root Page", for: UIControl.State())
        root.backgroundColor = UIColor.orange
        root.addTarget(self, action: #selector(self.gotoRootPage), for: UIControl.Event.touchUpInside)
        self.view.addSubview(root)
    }
    
    @objc func pushPage() {
        
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func popPage() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gotoIndexPage() {
        let viewController = self.navigationController?.viewControllers[1]
        self.navigationController?.popToViewController(viewController!, animated: true)
    }
    
    @objc func gotoRootPage() {
        self.navigationController?.popViewController(animated: true)
    }
}
