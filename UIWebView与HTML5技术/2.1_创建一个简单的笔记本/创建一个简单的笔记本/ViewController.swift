//
//  ViewController.swift
//  创建一个简单的笔记本
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //创建一个简单的笔记本
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 60, width: bounds.width, height: bounds.height-60)
        webView = UIWebView(frame: frame)
        
        webView.scrollView.showsVerticalScrollIndicator = true  //显示webView的垂直滚动条，当笔记内容较多时，需要使用垂直滚动条帮助用户浏览笔记
        self.view.addSubview(webView)
        
        //加载项目中的NoteBook.html网页
        let path = Bundle.main.path(forResource: "NoteBook", ofType: "html")
        let url = URL(string: path!)
        webView.loadRequest(NSURLRequest(url: url!) as URLRequest)
        
        let inserImage = UIButton(frame: CGRect(x: 0, y: 20, width: 160, height: 40))
        inserImage.setTitle("插入图片", for: UIControl.State.init(rawValue: 0))
        inserImage.backgroundColor = UIColor.purple
        inserImage.addTarget(self, action: #selector(ViewController.inserImage), for: .touchUpInside)
        self.view.addSubview(inserImage)
        
        let saveNote = UIButton(frame: CGRect(x: 160, y: 20, width: 160, height: 40))
        saveNote.setTitle("保存笔记", for: UIControl.State.init(rawValue: 0))
        saveNote.backgroundColor = UIColor.brown
        saveNote.addTarget(self, action: #selector(ViewController.saveNote), for: .touchUpInside)
        self.view.addSubview(saveNote)
        
    }
    
    @objc func inserImage() {
        
        //当用户点击该按钮时，通过执行webView对象的stringByEvaluatingJavaScript方法，从而调用JavaScript语言的insertImage方法，并传递项目根目录中的Coffee.png图片，供insertImage方法使用
        webView.stringByEvaluatingJavaScript(from: "insertImage('Coffee.png')")  //在实际工作中，可能需要从网络上下载图片，或者从相册、相机中加载图片，然后将图片路径传递给JavaScript方法
    }
    
    @objc func saveNote() {
        
        let note = webView.stringByEvaluatingJavaScript(from: "getNote()")
        print(note ?? "")  //在实际工作中，通常需要将笔记的内容保存在本地的SQLite数据库中，或者存储到远程的服务器
    }
    
}


