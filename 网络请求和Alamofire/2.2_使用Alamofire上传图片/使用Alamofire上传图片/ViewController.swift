//
//  ViewController.swift
//  使用Alamofire上传图片
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //当使用JSON或URL编码参数向服务器发送相对较少的数据时，Alamofire的request方法是足够完成任务的，但是当需要上传文件或大量Data数据时，就需要借助Alamofire的upload方法了
        let fileURL = Bundle.main.url(forResource: "iphone_large_2x", withExtension: "jpg")
        
        //第一个参数也可以是Data格式的数据，所以可以很方便的将内存中的图片或文件上传到服务器
        AF.upload(fileURL!, to: "https://httpbin.org/post")
            
            //就像下载过程一样，在等待数据上传的过程中，最好向用户显示上传的进度，以提升应用程序的用户体验
            //获得上传的进度
            .uploadProgress { progress in
                
                print("---fractionCompleted:\(progress.fractionCompleted)")  //表示上传数据的完成比例
                print("---completedUnitCount:\(progress.completedUnitCount)")  //表示已经上传的数据量
                print("---totalUnitCount:\(progress.totalUnitCount)")  //表示总共需要上传的数据量
            }
        
            .responseJSON { response in
                
                let message = "Result:\(response.result)"
                
                print(message)
            }
    }

}

