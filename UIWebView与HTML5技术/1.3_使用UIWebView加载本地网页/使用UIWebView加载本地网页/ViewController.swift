//
//  ViewController.swift
//  使用UIWebView加载本地网页
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用UIWebView加载本地网页
        //首先创建一个HTML页面，该网页包含一个用于用户注册的表单，表单包含用户名、密码两个文本框，允许用户输入自己的个人信息，然后点击表单底部的“提交”按钮，完成用户的注册操作，并向服务器提交表单，当表单被提交时，将执行名为submitForm的JavaScript方法
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height)
        webView = UIWebView(frame: frame)
        webView.backgroundColor = UIColor.clear
        self.view.addSubview(webView)
        
        let path = Bundle.main.path(forResource: "Register", ofType: "html")  //从应用程序束中获得Register.html文件所在路径
        let url = URL(string: path!)  //将路径转换为URL对象
        //通过webView对象的loadRequest方法加载指定路径的HTML页面
        webView.loadRequest(NSURLRequest(url: url!) as URLRequest)
        
        let getInfo = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        getInfo.setTitle("获得页面信息", for: .normal)
        getInfo.backgroundColor = UIColor.brown
        getInfo.addTarget(self, action: #selector(ViewController.getInfo), for: .touchUpInside)
        
        let submitForm = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        submitForm.setTitle("设置并提交表单", for: .normal)
        submitForm.backgroundColor = UIColor.brown
        submitForm.addTarget(self, action: #selector(ViewController.submitForm), for: .touchUpInside)
        
        self.view.addSubview(getInfo)
        self.view.addSubview(submitForm)
        
    }
    
    //当用户点击第一个按钮时，将获得并在日志区输出webView对象的网址和网页的标题信息
    @objc func getInfo() {
        
        //通过stringByEvaluatingJavaScript方法使webView对象可以调用网页中的JavaScript方法
        //UIWebView工具之所以在iOS项目开发中如此重要，就是因为它拥有stringByEvaluatingJavaScript方法，从而使UIWebView和HTML页面的沟通变得简单起来
        let url = webView.stringByEvaluatingJavaScript(from: "document.location.href")  //通过document.location.href获得当前网页的网址
        let title = webView.stringByEvaluatingJavaScript(from: "document.title")  //获得当前网页的标题文字
        let info = url! + "\n" + title!
        print(info)
    }
    
    @objc func submitForm() {
        
        let firstJs = "document.getElementById('userName').value = 'Jerry'"  //通过document对象的getElementById方法获得网页中id值为userName的文本框，并将该文本框的值设置为Jerry
        let secondJs = "submitForm()"  //表示网页中名为submitForm的JavaScript方法
        webView.stringByEvaluatingJavaScript(from: firstJs)
        webView.stringByEvaluatingJavaScript(from: secondJs)
    }
    
}



