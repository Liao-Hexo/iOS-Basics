//
//  ViewController.swift
//  使用AlamofireImage缓存图像
//
//  Created by 廖家龙 on 2021/7/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    var imageView: UIImageView?  //用来显示缩放后的图片
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //AlamofireImage就是Alamofire针对图像处理和图像缓存方面的扩展，当你的项目中需要加载、展示网络图片时，推荐使用AlamofireImage来做这些事
        
        //使用AlamofireImage缩放图像
        //scalingImage()
        
        coreImageFilters()
    }
    
    //执行图像缩放的功能
    func scalingImage() {
        
        let image = UIImage(named: "Girl")!
        let imageSize = CGSize(width: 100, height: 100)
        let scaledImage = image.af_imageScaled(to: imageSize)
        
        //AlamofireImage缩放图像的三种方式：
        //af_imageScaled(to:)，以忽略图像宽高比的方式，将图像强制缩放至指定尺寸
        //af_imageAspectScaled(toFit:)，保持图像的宽高比，将图像缩放至指定尺寸
        //af_imageAspectScaled(toFill:)，保持图像的宽高比，将图像填充至指定尺寸，超出尺寸的部分被裁剪
        
        self.imageView = UIImageView(image: scaledImage)
        
        self.imageView?.center = self.view.center
        
        self.view.addSubview(self.imageView!)
    }
    
    //使用AlamofireImage的滤镜
    func coreImageFilters() {
        
        let image = UIImage(named: "Family")!
        
        //给图片添加一个名为CIMotionBlur的动感模糊滤镜，并设置滤镜的输入半径为5，输入角度即动感方向为45度
        let blurredImage = image.af_imageFiltered(
            withCoreImageFilter: "CIMotionBlur",
            parameters: ["inputRadius": 5,"inputAngle":45]
        )
        
        self.imageView = UIImageView(image: blurredImage)
        
        self.imageView?.center = self.view.center
        
        self.view.addSubview(self.imageView!)
    }
    
}

