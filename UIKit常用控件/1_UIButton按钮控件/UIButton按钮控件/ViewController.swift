//
//  ViewController.swift
//  UIButton按钮控件
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIButton类是UIControl的一个子类，它实现了在触摸屏上添加交互按钮的功能，同时UIControl类继承自UIView类，所以UIButton又可以在屏幕上显示内容。而UIView继承于UIResponder，从而允许按钮响应用户触摸和手势
        
/*
        //依次创建了6种不同样式的UIButton按钮
        //设置-辅助功能-显示与文字大小-Button Shapes可以显示按钮控件的边框
        let buttonTypes: [UIButton.ButtonType] = [.system, .contactAdd, .detailDisclosure, .infoDark, .infoLight, .roundedRect]
        
        for i in 0..<buttonTypes.count {
            
            let button = UIButton(type: buttonTypes[i])
            button.frame = CGRect(x: 100, y: 50 + i*50, width: 120, height: 30)
            
            if i == 0 || i == 5 {
                button.setTitle("Button \(i+1)", for: .normal)
            }
            self.view.addSubview(button)
        }
*/
  
/*
        //UIButton按钮的状态
        let titleStates: [String] = ["正常状态", "高亮状态", "选中状态", "失效状态"]
        let buttonStates: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x: 80, y: 50, width: 140, height: 30)
        button1.setTitle(titleStates[0], for: buttonStates[0])
        self.view.addSubview(button1)
        
        //设置按钮的背景图片
        //button1.setBackgroundImage(UIImage(named: ""), for: UIControl.State.normal)
        
        let button2 = UIButton(type: .system)
        button2.frame = CGRect(x: 80, y: 100, width: 140, height: 30)
        button2.setTitle(titleStates[1], for: buttonStates[1])
        button2.isHighlighted = true  //将按钮设置为高亮状态
        self.view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.frame = CGRect(x: 80, y: 150, width: 140, height: 30)
        button3.setTitle(titleStates[2], for: buttonStates[2])
        button3.isSelected = true  //将按钮设置为选中状态
        self.view.addSubview(button3)
        
        let button4 = UIButton(type: .system)
        button4.frame = CGRect(x: 80, y: 200, width: 140, height: 30)
        button4.setTitle(titleStates[3], for: buttonStates[3])
        button4.isEnabled = false  //将按钮设置为失效状态
        self.view.addSubview(button4)
        
*/
        
        //UIButton按钮使用Target-Action(目标-动作)设计模式来响应用户的触摸事件，该设计模式可以让代码解耦，使代码之间关联性降低，以便于后期的维护
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.frame = CGRect(x: 20, y: 100, width: 280, height: 44)
        button.backgroundColor = UIColor.purple
        button.tintColor = UIColor.yellow  //按钮的前景颜色
        button.setTitle("Tap Me", for: .normal)
        
        //当用户按下按钮并抬起手指时，触发该事件执行buttonTapped方法
        //@selector是Objective-C时代的一个关键字，可以将一个方法转换并赋值给一个SEL类型，类似于一个动态的函数指针。在Swift中没有@selector，而是使用#selector从暴露给Objective-C的代码中获取一个selector
        button.addTarget(self, action: #selector(self.buttonTapped(_ :)), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    @objc func buttonTapped(_ button:UIButton) {
        
        button.setTitle("The button is tapped.", for: .normal)
        button.isEnabled = false
    }
}

