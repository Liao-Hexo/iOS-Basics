//
//  ViewController.swift
//  创建CoreData实体并插入数据
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit
import CoreData  //引入CoreData框架

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //⭐️注意：项目名称一定不能使用CoreData，创建项目时记得选上Use Core Data选项
        //选择.xcdatamodeld文件，然后依次点击Editor、Create NSManagedObject subclass
        //Codegen：Manual/None
        
        //创建Core Data实体并插入数据
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate  //从UIApplication中获得当前项目中的AppDelegate对象
        let managedObjectContext = appDelegate.persistentContainer.viewContext //获得AppDelegate对象的managedObjectContext托管对象的上下文
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext) as! User  //通过NSEntityDescription.insertNewObject在托管对象上下文中插入一条User实体对象
        
        newUser.userName = "John"
        newUser.password = "123456"
        
        //执行数据的存储操作
        do {
            try managedObjectContext.save()  //对newUser对象进行保存操作
            print("成功保存数据。")
            
        } catch {
            
            print("保存数据失败。")
        }
        
    }
    
}
