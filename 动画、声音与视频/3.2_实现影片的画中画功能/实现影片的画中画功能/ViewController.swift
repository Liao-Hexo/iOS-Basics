//
//  ViewController.swift
//  实现影片的画中画功能
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //实现影片的画中画功能
        
        //使用AVPlayer播放影片只是单纯的进行视频的播放，并不会提供视频播放控制器，如果需要对视频的播放进行暂停、继续播放等控制，就需要创建自定义的按钮了
        //Apple推出了一个ViewController的子类AVPlayerViewController，其不仅可以实现视频的播放，还额外提供了对视频播放进行管理的标准控制界面，还可以轻松的实现iPad中的画中画效果
        let moviePath = Bundle.main.path(forResource: "Sunrise", ofType: "mp4")
        let movieURL = URL(fileURLWithPath: moviePath!)
        
        let avPlayer = AVPlayer(url: movieURL as URL)
        
        //创建一个AVPlayerViewController视频播放视图控制器
        let playerVC = AVPlayerViewController()
        playerVC.player = avPlayer
        
        playerVC.videoGravity = AVLayerVideoGravity.resizeAspect
        playerVC.allowsPictureInPicturePlayback = true  //允许在iPad中进行视频播放的画中画功能
        playerVC.showsPlaybackControls = true  //在播放视频的过程中显示视频播放标准控制界面
        
        playerVC.view.frame = self.view.bounds
        
        playerVC.player!.play()  //实现视频的播放
        
        self.view.addSubview(playerVC.view)
        
        //为了激活在iPad中视频播放的画中画功能，还需要对项目进行一些设置操作，打开Signing & Capabilities，激活Background Modes选项，勾选Audio,Airplay,and Picture in Picture
        
    }
    
}

