//
//  ViewController.swift
//  使用AVPlayer播放影片
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //在iOS开发中，播放视频通常采用两种方式，一种是使用MPMoviePlayerController，另一种是使用AVPlayer，MPMoviePlayerController播放方式的使用更加简单，但是功能不如AVPlayer强大，而且随着iOS版本的升级，MPMoviePlayerController将逐渐被丢弃
        
        //使用AVPlayer播放影片
        let moviePath = Bundle.main.path(forResource: "movie", ofType: "mp4")
        let movieURL = URL(fileURLWithPath: moviePath!)
        
        let avPlayer = AVPlayer(url: movieURL as URL)  //创建一个AVPlayer实例，并加载指定位置的视频文件
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)  //创建一个AVPlayerLayer视频播放层，AVPlayer是一个不可见的组件，要将视频文件显示在用户界面上，需要使用AVPlayerLayer类
        
        avPlayerLayer.frame = self.view.bounds  //设置边框大小与当前视图控制器根视图的边界属性保持一致，使视频的播放区域和设备的屏幕尺寸相同
        
        //AVLayerVideoGravity.resizeAspectFill：保留视频的宽高比，并对视频进行缩放，以填满层的范围区域
        //AVLayerVideoGravity.resizeAspect：在视频层的显示范围内缩放视频大小，以保持视频的原始宽高比
        //AVLayerVideoGravity.resize：将视频内容拉伸来匹配视频层的显示范围
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        self.view.layer.addSublayer(avPlayerLayer)
        
        avPlayer.play()  //开始视频的播放
        
    }
    
}

