//
//  ViewController.swift
//  使用UIWebView加载HTML字符串和GIF动画
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用UIWebView加载HTML字符串和GIF动画
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height)
        webView = UIWebView(frame: frame)
        webView.backgroundColor = UIColor.clear
        self.view.addSubview(webView)
        
        let loadHTML = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        loadHTML.setTitle("加载HTML网页", for:.normal)
        loadHTML.backgroundColor = UIColor.brown
        //添加点击事件，调用loadHTML方法
        loadHTML.addTarget(self, action: #selector(ViewController.loadHTML), for: .touchUpInside)
        
        let loadGIF = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        loadGIF.setTitle("加载GIF动画", for: .normal)
        loadGIF.backgroundColor = UIColor.brown
        //添加点击事件，调用loadGIF方法
        loadGIF.addTarget(self, action: #selector(ViewController.loadGIF), for: .touchUpInside)
        
        self.view.addSubview(loadHTML)
        self.view.addSubview(loadGIF)
        
    }
    
    @objc func loadHTML() {
        
        let team = "<div style = 'color:#ff0000; font-size:20px;'> 团队名称：酷课堂 </div>"
        let tel = "<div> 电话：<span style = 'color:#ff0000'> 15011122222 </span></div>"
        let url = "<div><b> 网址：http://www.coolketang.com</b></div>"
        let html = team + tel + url  //将三个div标签拼接成一个字符串，供webView对象加载使用
        
        webView.dataDetectorTypes = [UIDataDetectorTypes.link, UIDataDetectorTypes.phoneNumber]  //dataDetectorTypes属性被用来设置webView可以将网页中的哪些元素设置为可交互的对象
        
        webView.loadHTMLString(html, baseURL: nil)  //将拼接好的HTML字符串加载到webView对象中
    }
    
    @objc func loadGIF() {
        
        let resourceURL = Bundle.main.resourceURL  //获得应用程序的根目录，因为GIF动画被保存在根目录的位置
        webView.loadHTMLString("<img src='WildWorld.gif'>", baseURL: resourceURL)
    }
    
}


