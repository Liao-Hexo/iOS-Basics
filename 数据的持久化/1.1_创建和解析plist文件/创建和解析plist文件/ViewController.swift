//
//  ViewController.swift
//  创建和解析plist文件
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //一个功能丰富的应用程序，它的数据不仅存储在内存中，而是将更多的数据写入磁盘，进行持久化存储
        //iOS中的数据持久化方式基本上有4种：plist属性列表、对象归档、SQLite3、Core Data
        
        //在iOS开发工作中，经常需要使用plist文件存储一些属性或配置信息，plist文件的全名是Property List，即属性列表文件，它是一种用来存储串行化后的对象的文件，由于属性列表文件的扩展名为.plist，因此通常被简称为plist文件
        //plist文件为属性列表文件，以类似于键值对(key-value)的形式存储项目中的各种数据
        
        //创建和解析plist文件
        //plist文件支持Array数组和Dictionary字典两种集合类型，以及Boolean布尔类型、Data二进制数据类型、Date日期类型、Number数字类型和String字符串类型
        //plist文件是以XML文件的格式进行存储的，在demoPlist.plist文件名称上右击，然后依次选择Open As、Source Code选项，查看该plist文件的源代码
        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")  //获得demoPlist.plist文件在项目沙箱目录中的路径
        let data: NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!  //加载plist文件，并将plist文件转换为可变字典类型的数据
        
        let message = data.description
        let name = data["Name"] as! String
        let age = data["Age"] as! Int
        
        print(message)
        print(name)
        print(age)
        
    }
    
}

