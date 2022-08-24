//
//  ViewController.swift
//  UIAlertController
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 20, y: 120, width: 280, height: 44)
        button.setTitle("Question", for: .normal)
        
        //当点击该按钮时，执行一个方法以弹出警告窗口
        //button.addTarget(self, action: #selector(self.showAlert), for: .touchUpInside)
        
        //当点击该按钮时，执行一个方法以弹出动作表单
        button.addTarget(self, action: #selector(self.showActionSheet), for: .touchUpInside)
        
        button.backgroundColor = UIColor.orange
        self.view.addSubview(button)
    }
    
    @objc func showAlert() {
        
        //preferredStyle属性的值是一个UIAlertController.Style类型的枚举，该枚举包含UIAlertController.Style.alert和UIAlertController.Style.actionSheet，分别用来创建警告窗口和动作表单
        let alert = UIAlertController(title: "Information", message: "Are you a student?", preferredStyle: UIAlertController.Style.alert)
        
        //UIAlertAction是指警告窗口中的供用户选择点击的选项按钮
        //style是枚举类型：包含default、destructive、cancel三个不同的值
        //handler是用户点击该选项按钮时所执行的动作，具体的任务在后面的闭包语句里执行
        //将三个选项按钮添加到警告窗口中，然后以模态的方式在当前的视图控制器中打开警告窗口
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (alerts: UIAlertAction) -> Void in
            print("Yes,I'm a student.")
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: { (alerts: UIAlertAction) -> Void in
            print("No,I'm not a student.")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
        
    }
    
    //和警告窗口不同的是，动作表单的展示形式和设备大小有关，在iPhone上，动作表单从屏幕底部升起，在iPad上，动作表单则是以弹出框的形式展现的
    @objc func showActionSheet() {
        
        let actionSheet = UIAlertController(title: "Information", message: "What's your favorite?", preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Fishing", style: UIAlertAction.Style.default, handler: { (alerts: UIAlertAction) -> Void in
            print("I like fishing.")
        }))
        actionSheet.addAction(UIAlertAction(title: "Hunting", style: UIAlertAction.Style.destructive, handler: { (alerts: UIAlertAction) -> Void in
            print("I like hunting.")
        }))
        //如果动作表单中有style为cancel的按钮，那么它永远都会出现在表单列表的底部，无论添加的次序是怎样的，而其他按钮则会按照添加的次序从上往下依次显示
        actionSheet.addAction(UIAlertAction(title: "Nothing", style: UIAlertAction.Style.cancel, handler: { (alerts: UIAlertAction) -> Void in
            print("A Life of Nonsense.")
        }))

        self.present(actionSheet, animated: true) {
            print("What's your favorite?")
        }
    }
    
}
