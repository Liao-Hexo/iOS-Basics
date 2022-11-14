//
//  ViewController.swift
//  使用AVAudioPlayer播放音乐
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit
import AVFoundation

//通过遵守AVAudioPlayerDelegate协议，可以实现对音乐播放状态的监测，比如音乐播放的结束事件或者被来电事件所中断的状态
class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //使用AVAudioPlayer播放音乐
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)  //从项目中获得导入的音频文件的路径，并将字符串格式的路径转换为URL类型
        
        //AVAudioPlayer的初始化操作会抛出异常
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)  //加载指定路径的音频文件
            
            audioPlayer.volume = 1.0  //设置音频播放的音量为最高音量1.0
            audioPlayer.numberOfLoops = -1  //实现音频文件的循环播放
            //audioPlayer.numberOfLoops = 1  //播放一次
            
            audioPlayer.delegate = self
            
            audioPlayer.play()  //开始播放音频文件
            
        } catch{
            print(error)
        }
        
        let stopMusic = UIButton(frame: CGRect(x: 20, y: 80, width: 280, height: 44))
        stopMusic.backgroundColor = UIColor.purple
        stopMusic.setTitle("暂停/恢复音乐", for: UIControl.State.init(rawValue: 0))
        
        stopMusic.addTarget(self, action: #selector(ViewController.pauseOrResumeMusic), for: .touchUpInside)
        
        self.view.addSubview(stopMusic)
        
    }
    
    @objc func pauseOrResumeMusic(){
        if self.audioPlayer.isPlaying {
            self.audioPlayer.pause()  //暂停音乐的播放
        }
        else{
            self.audioPlayer.play()  //开始或恢复音乐的播放
        }
    }
    
    //实现AVAudioPlayerDelegate协议中的方法，当音频的播放由于来电等特殊情况而被中断时，将调用此方法
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("音乐播放被打断。")
    }
    
    //实现AVAudioPlayerDelegate协议中的方法，当音频的播放结束时，将调用此方法
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("音乐播放完毕。");
    }
    
}

