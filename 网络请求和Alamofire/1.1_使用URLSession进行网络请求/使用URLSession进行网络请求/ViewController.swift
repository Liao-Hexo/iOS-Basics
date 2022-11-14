//
//  ViewController.swift
//  使用URLSession进行网络请求
//
//  Created by 廖家龙 on 2021/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!  //用来显示接收到的网络数据

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //HTTP定义了与服务器交互的不同方法，最基本的方法有4种，分别是GET、POST、PUT、DELETE，对应着对URL资源的查、改、增、删四个操作，GET一般用于获取/查询资源信息，而POST一般用于更新资源信息
        //URL全称是资源描述符，一个URL地址描述一个网络上的资源
        //每个GET和POST都由一系列HTTP请求头组成，这些请求头定义了客户端从服务器请求了什么，而响应则是由一系列HTTP应答头和应答数据组成的，如果请求成功，就返回应答
        
        /*
         GET和POST的区别：
         1.GET是从服务器上获取数据，POST是向服务器传送数据
         2.GET方式通过URL提交数据，数据在URL中可以看到；POST方式是将数据放置在HTML HEADER内提交
         3.GET方式提交的数据最多只能有1024字节，而POST则没有此限制
         4.使用GET的时候，参数会显示出来，而POST不会，因此如果需要提交的数据是非敏感数据，那么可以使用GET方式；如果用户输入的数据包含敏感数据，那么还是推荐使用POST
         
         简单来说，GET请求是将参数直接写在访问路径上，特点是操作方便、简单，不过容易被外界看到，所以安全性不高；POST请求的操作相对复杂，需要将参数和地址分开，不过安全性高，参数放在body里面，不易被捕获，而且可以发送更多的数据
         */
        
        //同步意味着线程阻塞，在主线程中使用此方法会响应任何用户事件，以同步的方式从网络请求数据，一旦发送同步请求，应用程序将停止用户交互，直至服务器返回数据完成，才可以进行下一步操作。在同步请求过程中，应用程序的主线程不响应其他事件，直到同步请求结束
        //异步请求不会阻塞主线程，而会建立一个新的线程来操作，用户发出异步请求后，依然可以进行其他操作，应用程序可以继续运行，也就是说，异步请求不会阻塞主线程对其他事件的响应，所以用户体验会优于同步请求；在iOS开发中，异步请求会使用URLSession的委托协议URLSessionDelegate，在请求的不同阶段回调不同的委托对象方法
        
        //使用URLSession进行网络请求，URLSession类支持三种类型的任务：请求数据、下载和上传
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 700))
        label.text = "Loading.."
        label.font = UIFont(name: "Arial", size: 14)
        label.backgroundColor = UIColor.orange
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.view.addSubview(label)
        
        //创建了一个URL网址对象
        let urlString: String = "https://www.coolketang.com"
        let url: URL! = URL(string: urlString)
        
        let request: URLRequest = URLRequest(url: url)  //根据URL网址初始化一个网络请求URLRequest对象
        let session = URLSession.shared  //获得URLSession单例对象
        
        //通过session单例对象的方法创建一个任务，根据指定的URL请求远程内容，并在完成后调用尾部的闭包处理程序
        let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)  //输出错误日志
            } else {  //处理请求成功的情况
                
                //由于需要更改界面元素，因此通过DispatchQueue.main.async语句返回主线程并以异步的方式更新label对象的文字内容
                DispatchQueue.main.async {
                    let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    self.label.text = str as String?
                }
                //print(response)
            }
        })
        
        dataTask.resume()  //开始执行请求任务
        
    }

}
