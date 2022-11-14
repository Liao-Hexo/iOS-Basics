//
//  ViewController.swift
//  检索Core_Data中的数据
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit
import CoreData  //引入CoreData框架

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //⭐️先插入数据、再检索数据
        
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
        
        //检索Core Data中的数据
        let entity: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "User",in: managedObjectContext)  //通过NSEntityDescription.entity获得托管对象上下文中的User实体
        
        let request = NSFetchRequest<User>(entityName: "User")  //创建一个User类型的NSFetchRequest查询请求对象
        request.fetchOffset = 0  //fetchOffset属性用于设置数据查询的偏移位置，例如返回结果有A、B、C、D四个结果，当设置fetchOffset为1时，仅返回B、C、D三个结果
        request.fetchLimit = 10  //获取从偏移值为0的位置起的10条数据，如果总的数据量少于10条，就返回全部的数据
        request.entity = entity  //设置request对象的entity为User类型的实体，即查询持久化存储中类型为User的符合查询条件的实体
        
        //创建一个Predicate断言，以查询userName为John的User类型的实体，如果不设置断言，就会查询所有类型的为User的实体
        let predicate = NSPredicate(format: "userName= 'John' ", "")
        request.predicate = predicate
        
        do{
            let results:[AnyObject]? = try managedObjectContext.fetch(request)  //调用fetch方法，根据指定的断言查询符合条件的User类型的实体，并将查询的结果存储在一个名为results的AnyObject类型的数组中
            
            for user:User in results as! [User]{
                print("userName = \(user.userName!)")
                print("password = \(user.password!)")
            }
        } catch{
            print("获取数据失败。")
        }
        
    }
    
}

