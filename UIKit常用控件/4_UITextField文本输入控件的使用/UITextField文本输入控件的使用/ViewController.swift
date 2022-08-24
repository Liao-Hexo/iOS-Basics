//
//  ViewController.swift
//  UITextField文本输入控件的使用
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

//遵循UITextFieldDelegate协议，这样我们就可以使用协议中的方法对UITextField对象进行状态的检测
class ViewController: UIViewController, UITextFieldDelegate {
    
    var textField: UITextField!  //方便在键盘弹出和收起时修改UITextField对象的位置

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         
        //当创建一个UITextField对象时，在配置UITextField界面属性的同时，往往还需要设置UITextField对象的代理，通过代理可以完成很多重要的任务
        //1.检测用户是否被允许编辑UITextField中的内容
        //2.检测用户输入文本的合法性
        //3.检测键盘的return按钮是否被点击
        //4.将用户输入的文本转发到应用程序的其他部分
        
        let textField = UITextField(frame: CGRect(x: 30, y: 80, width: 260, height: 40))
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect  //边框样式：.line、.none
         
        textField.placeholder = "Your Password"  //placeholder常用于提示用户在textField对象中输入什么样的内容，当用户在textField区域内点击时，placeholder会自动消失
         
        textField.autocorrectionType = UITextAutocorrectionType.no  //若该值为yes，则将自动检测textField区域中的文字是不是有拼写错误或无法识别的文字内容，然后自动将错误的文字内容替换为系统建议的文字
         
        textField.returnKeyType = UIReturnKeyType.done  //UIReturnKeyType共包含done、continue、search等12个枚举值，它的主要作用是在键盘中的return key上显示指定的文字内容，仅是更改显示内容从而起到提醒用户的作用，并不会对return key的实际功能产生任何影响
         
        textField.clearButtonMode = UITextField.ViewMode.whileEditing  //在用户输入、编辑文本时，在textField输入框的右侧显示一个删除图标
         
        textField.keyboardType = UIKeyboardType.default  //UIKeyboardType共包含13个枚举值，用来适配用户名输入、手机号码输入等不同的使用场景：.emailAddress、.phonePad、.numberPad
         
        textField.keyboardAppearance = UIKeyboardAppearance.dark  //设置键盘的外观为暗色模式，.light亮色模式
         
        textField.isSecureTextEntry = true  //这样输入的字符将显示为小圆点，从而起到保护内容的作用，常用于密码输入的工作环境
        
        //UITextField没有UILabel的富文本属性，但是可以通过设置其leftView属性给UITextField增加图片
        //在textField显示区域的左侧显示一个小图标
        let lockView = UIImageView(image: UIImage(named: "lock"))
        lockView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textField.leftView = lockView
        textField.leftViewMode = .always
        
        textField.delegate = self  //设置textField对象的代理为当前的视图控制器
        
        self.view.addSubview(textField)
         
        //添加一个代理方法，用来响应键盘的return key被点击的事件，当键盘上的return key被点击时，通过resignFirstResponder()方法取消textField的焦点状态，从而隐藏键盘的显示
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
             
            textField.resignFirstResponder()
            return true
        }
 
        */
        
        textField = UITextField(frame: CGRect(x: 30, y: 680, width: 260, height: 30))
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Your Number"

        textField.delegate = self

        self.view.addSubview(textField)

        //观察者模式: 一个对象的变化,能够被另一个对象知道
        //使用通知的方式监测键盘的显示和隐藏，通过NotificationCenter创建两个观察者，分别监测键盘的显示和隐藏事件，当键盘显示或隐藏时，通过动态调整文字输入框的位置来避免键盘的遮挡
        //对keyboardWillShowNotification事件进行观察和监听，当事件发生时，调用keyboardWillShow方法
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }

    @objc func keyboardWillShow(_ notification: Notification?) {
        textField.frame = CGRect(x: 30, y: 380, width: 260, height: 30)
    }

    @objc func keyboardWillHide(_ notification: Notification?) {
        textField.frame = CGRect(x: 30, y: 680, width: 260, height: 30)
    }
    
}

