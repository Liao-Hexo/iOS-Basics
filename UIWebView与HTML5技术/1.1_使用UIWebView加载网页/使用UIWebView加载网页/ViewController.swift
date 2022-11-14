//
//  ViewController.swift
//  使用UIWebView加载网页
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

//UIWebView目前被替换为WKWebView
//添加协议，检测UIWebView加载网页的状态
class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用UIWebView加载网页
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        let webView = UIWebView(frame: frame)
        
        webView.delegate = self  //设置webView对象的代理为当前的视图控制器类，由该视图控制器类提供方法，以实现对webView对象的检测
        
        webView.backgroundColor = UIColor.black
        
        let url = URL(string: "https://liao-hexo.github.io/archives/")!  //网址需要采用HTTPS协议
        let urlRequest = NSURLRequest(url: url)  //将URL网址对象转换为一个NSURLRequest请求
        
        webView.loadRequest(urlRequest as URLRequest)  //由webView对象加载这个网页请求
        
        self.view.addSubview(webView)
        
    }
    
    //实现了UIWebViewDelegate协议中的webViewDidStartLoad方法，该方法将在webView开始加载网页时调用
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        //通过UIApplication对象在顶部的状态栏显示用于描述网络状态的旋转风火轮的图标
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

