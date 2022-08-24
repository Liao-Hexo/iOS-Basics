//
//  ViewController.swift
//  UISwitch开关控件
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //设置其宽度和高度的值是无意义的，所以此处设置其值为0
        let uiSwitch = UISwitch(frame: CGRect(x: 130, y: 100, width: 0, height: 0))
        
        //三种颜色属性
        uiSwitch.tintColor = UIColor.brown
        uiSwitch.thumbTintColor = UIColor.purple
        uiSwitch.onTintColor = UIColor.orange
        
        uiSwitch.setOn(true, animated: true)  //设置了开关控件的默认状态为激活状态
        
        uiSwitch.addTarget(self, action: #selector(self.switchChanged(_ :)), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(uiSwitch)
    }
    
    //通过属性isOn来获取UISwitch开关对象的布尔值
    @objc func switchChanged(_ uiSwitch: UISwitch) {
        
        var message = "Turn on the switch."
        
        if !uiSwitch.isOn {
            message = "Turn off the switch."
        }
        print(message)
    }
    
}

