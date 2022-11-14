//
//  ViewController.swift
//  使用URLSession下载图片并显示进度
//
//  Created by 廖家龙 on 2021/7/20.
//

import UIKit

//借助URLSessionDownloadDelegate中的代理方法实现下载进度的实时检测
class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    //添加三个控件，用来显示图片下载的进度
    var backgroundView: UIView!
    var foregroundView: UIView!
    var progressLabel: UILabel!
    
    //添加第二个代理方法，该代理方法用来监听图片下载完成并存储在指定磁盘位置的事件
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do
            {
                //当图片完成下载后，首先获得图像的临时存储路径
                let originalPath = location.path
                print("Original location: \(originalPath)")
                
                //创建位于沙箱Documents目录下的一个图片路径，下载后的临时图片将从临时目录移动到该位置
                let targetPath: String = NSHomeDirectory() + "/Documents/background.png"
                
                //将临时图片移动到指定的位置
                let fileManager: FileManager = FileManager.default
                if !fileManager.fileExists(atPath: targetPath)
                {
                    try fileManager.moveItem(atPath: originalPath, toPath: targetPath)
                    print("new location: \(targetPath)")
                }
            }
        catch
        {
            print("FileManager  error.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //使用URLSession下载图片并显示进度：除了请求远程数据外，URLSession还具有下载和上传功能
        backgroundView = UIView(frame:CGRect(x: 16, y: 106, width: 288, height: 44))
        backgroundView.backgroundColor = UIColor.lightGray
        
        foregroundView = UIView(frame:CGRect(x: 20, y: 110, width: 0, height: 36))
        foregroundView.backgroundColor = UIColor.green
        
        progressLabel = UILabel(frame:CGRect(x: 20, y: 160, width: 280, height: 36))
        progressLabel.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(foregroundView)
        self.view.addSubview(progressLabel)
        
        //初始化了一个URLRequest网络请求对象，表示需要下载的一张图片素材的路径
        let url = URL(string: "https://coolketang.com/images/img_bg_1.jpg")!
        let request: URLRequest = URLRequest(url: url)
        
        let urlSession = self.buildSession() as Foundation.URLSession  //urlSession对象是由视图控制器类的buildSession方法实现的
        let task = urlSession.downloadTask(with: request)
        
        task.resume()  //开始下载任务的执行
    }
    
    func buildSession() -> Foundation.URLSession {
        
        var session: URLSession? = nil
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config, delegate: self, delegateQueue: nil)  //设置其代理delegate为当前的视图控制器对象，由视图控制器对象实现代理中用来监听图片下载进度的方法
        
        return session!
    }
    
    //添加用来监听图片下载进度的方法
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let rate: CGFloat = CGFloat(totalBytesWritten)/CGFloat(totalBytesExpectedToWrite)  //获得图像已经下载的字节占总字节的比例，totalBytesWritten表示已经下载的字节数，totalBytesExpectedToWrite表示需要下载的总字节数，两者之间的比例就是当前图片下载进度的百分比值
        
        DispatchQueue.main.async(execute: { () in
            
            self.foregroundView.frame.size.width = rate * 280  //根据下载进度的百分比调整foregroundView进度条的宽度，随着下载百分比的增加，foregroundView进度条的宽度也随之增加，这样就实现了模拟图像下载进度的动画效果
            if rate == 1.0 {
                self.progressLabel.text = "Finished 😝"
            }
        })
    }
    
}

