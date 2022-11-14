//
//  ViewController.swift
//  使用Alamofire进行GET和POST请求
//
//  Created by 廖家龙 on 2021/7/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Alamofire在默认状态下以GET方式进行网站请求
        responseJsonHandler()
        
        //postHandler()
    }
    
    var a: String = ""
    
    //进行网络请求，并将服务器返回的内容输出为JSON格式的日志
    func responseJsonHandler() {
        
        
        AF.request("https://httpbin.org/get").responseJSON { response in
            
//            guard let strongSelf = self else { return }
            
            self.a = "ffff"
            print("🌟🌟🌟\(self.a)")
            
//            if let json = response.value {
//
//                print("JSON:\(json)")
//            }
            
        }
    }
    
    func postHandler() {
        
        var parameters: Dictionary<String, String>
        parameters = ["email": "fzhlee@coolketang.com", "password": "123456"]
        
        let url = "https://httpbin.org/post"
        
        //第一个参数表示网络请求的路径
        //第二个参数method表示HTTP请求方式
        //第三个参数parameters表示需要提交至服务器的数据
        AF.request(url, method: HTTPMethod.post, parameters: parameters).responseJSON { response in
            
            //输出网络请求的HTTP方法和头文件，其中头文件在和服务器端的同事沟通接口时有可能需要
            debugPrint("httpMethod:" + (response.request?.httpMethod)!)
            debugPrint("allHTTPHeaderFields: + " ,response.request?.allHTTPHeaderFields ?? "")
            
            if let json = response.value {
                
                print("JSON: \(json)")
            }
        }
    }

}

