//
//  ViewController.swift
//  使用JavaScript回调原生程序
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

//使用该协议中的方法对网页跳转的请求进行监听
class ViewController: UIViewController, UIWebViewDelegate {
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用JavaScript回调原生程序
        //使用UIWebView对象，通过stringByEvaluatingJavaScript方法来调用HTML中的JavaScript语言，那么JavaScript是否可以回调原生程序呢？
        //我们可以通过UIWebView的重定向请求功能来实现JavaScript的回调
        
        //创建一个HTML文件
        
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height)
        webView = UIWebView(frame: frame)
        
        webView.delegate = self
        
        webView.backgroundColor = UIColor.clear
        self.view.addSubview(webView)
        
        //加载被导入项目中的HTML文件
        let path = Bundle.main.path(forResource: "GetDeviceInfo", ofType: "html")
        let url = URL(string: path!)
        webView.loadRequest(NSURLRequest(url: url!) as URLRequest)
        
    }
    
    //实现UIWebViewDelegate协议中的shouldStartLoadWith:request:方法，该方法会监听所有webView对象中的网页跳转的请求，然后通过对请求的URL路径进行检测，从而判断是否通过该请求
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        let url = request.url?.absoluteString  //获得网页打算跳转到的网址
        let components = url?.components(separatedBy: ":")  //使用冒号对网址字符串进行分隔，从而获得分隔后的数组对象
        let firstElement = components?[0]  //获得数组中的第一个字符串对象，即网络协议
        
        if (components?.count)! > 1 && firstElement! == "callios"
        {
            let model = UIDevice.current.model  //获得当前设备的型号
            let systemName = UIDevice.current.systemName  //操作系统名称
            let systemVersion = UIDevice.current.systemVersion  //操作系统的版本号
            
            let message = "设备类型:"+model+"\\n系统类型:"+systemName+"\\n系统版本:"+systemVersion
            
            webView.stringByEvaluatingJavaScript(from: "alert('" + message + "')")  //通过webView.stringByEvaluatingJavaScript反过来调用JavaScript的alert方法，将当前设备的信息返回网页，并在网页中使用alert方法弹出窗口，在网页中显示传递过来的设备信息
            
            return false
        }
        return true
    }
    
}

