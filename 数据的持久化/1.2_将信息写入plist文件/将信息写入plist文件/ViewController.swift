//
//  ViewController.swift
//  将信息写入plist文件
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //将信息写入plist文件
        let dic: NSMutableDictionary = NSMutableDictionary()  //创建了一个NSMutableDictionary可变字典对象
        
        //以键值对的形式创建两个对象，并添加到可变字典对象中
        dic.setObject("Bruce", forKey: "Name" as NSCopying)
        dic.setObject(22, forKey: "Age" as NSCopying)
        
        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        dic.write(toFile: plistPath!, atomically: true)  //将可变字典对象写入plist文件中
        
        let data: NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!  //将plist文件加载到内存中，并转换为可变字典对象，从而查看写入后的plist文件的内容
        let message = data.description
        
        print(plistPath!)  //plist文件在项目中的位置，访达中定位该位置可以看到plist文件
        print(message)
        
    }
    
}

