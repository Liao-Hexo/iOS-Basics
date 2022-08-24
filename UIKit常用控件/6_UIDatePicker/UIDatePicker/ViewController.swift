//
//  ViewController.swift
//  UIDatePicker
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ViewController: UIViewController {
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIDatePicker是一个控制器类，封装了UIPickerView，继承自UIControl，专门用于接受日期和时间的输入
        //UIDatePicker使用多个可转动的轮子来让用户选择日期和时间，当用户转动完轮子改变日期或时间的时候，UIDatePicker会发送UIControlEvents.valueChanged消息，通过桢听这个消息可以做出相应的处理
        
        //UIDatePicker具有4种显示模式：日期和时间、日期、时间、计时
        
        datePicker.center = CGPoint(x: 160, y: 200)  //设置它的中心点位置
        
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime  //设置其显示模式为日期时间
        
        //设置UIDatePicker对象的最小值和最大值，从而只允许用户设置在两个数值之间的日期和时间
        datePicker.minimumDate = Date()
        datePicker.maximumDate = Date(timeInterval: 3*24*60*60, since: Date())
        self.view.addSubview(datePicker)
        
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.frame = CGRect(x: 20, y: 360, width: 280, height: 44)
        button.backgroundColor = UIColor.orange
        button.setTitle("Get Date", for: .normal)
        
        //当点击该按钮时，获取UIDatePicker日期时间拾取器的当前值
        button.addTarget(self, action: #selector(getDateTime(_ :)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    @objc func getDateTime(_ button: UIButton) {
        
        let date = datePicker.date  //获得拾取的值
        
        //将日期转换为字符串
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateAndTime = dateFormatter.string(from: date)
        
        print(dateAndTime)
    }
    
}

