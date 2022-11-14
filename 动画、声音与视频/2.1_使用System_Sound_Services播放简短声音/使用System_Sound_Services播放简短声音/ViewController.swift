//
//  ViewController.swift
//  使用System_Sound_Services播放简短声音
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //音频播放从形式上可以分为音效播放和音乐播放，音效主要指的是一些比较短暂的音频播放，通常作为点缀音效，对于这类音频不需要进行进度、循环等控制。后者指的是一些较长的音频，通常是主音频，对于这些音频的播放通常需要进行精确控制
        //在iOS中，通常分别使用System Sound Services和AVAudioPlayer来完成音效和音乐的播放，除了这两种方式之外，还可以选择Audio Queue Services和Open AL技术，这4种音频播放技术各有自身的特点
        
        //System Sound Services是最底层，也是最简单的音频播放服务，通过提供的C语言接口，允许开发者通过简单的调用AudioServicesPlaySystemSound方法播放一些简短的音频文件，使用此方法比较适合播放一些短暂的提示或警告声音
        //AVAudioPlayer可以播放单一的音频文件，可以播放任意长度的音频文件、支持循环播放、可以同步播放多个音频文件、控制播放进度以及从音频文件的任意一点开始播放等，比如用它可以很方便的实现重复播放；它也可以很方便的调节左右声道的音量，从而实现很酷的立体声效果，因此它很适用于游戏中的音频播放；由于AVAudioPlayer没有队列这个概念，因此它只能播放一个指定路径的音频，如果需要播放多个音频，可以通过创建多个AVAudioPlayer实例来实现
        //Audio Queue Services对音频进行播放可以完全实现对声音的控制，开发者可以将声音数据从文件中读取到内存缓冲区，并对声音数据进行特殊处理，比如进行声音的快速、慢速播放，或者改变声音的音色等
        //Open AL是一个跨平台的开源音频处理接口，它为音频播放提供了一套更加底层、更加精细的方案，特别适合具有复杂音频使用场景的游戏开发
        
        //使用System Sound Services播放简短声音，虽然System Sound Services无法直接实现音频文件的循环播放，但是通过System Sound Services的AudioServicesAddSystemSoundCompletion方法对音频的播放事件进行监听，当音频播放结束之后，可以重复音频的播放，从而实现音频的循环播放功能
        var _soundId: SystemSoundID = 0  //声明一个系统声音标识类型的声音变量
        let path = Bundle.main.path(forResource: "camera", ofType: "wav")  //获取路径
        let soundUrl = URL(fileURLWithPath: path!)  //将字符串格式的文件路径转换为URL路径
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &_soundId)  //加载指定路径的音频文件，并创建一个System sound对象
        
        //给音频播放添加播放结束的状态监听方法
        AudioServicesAddSystemSoundCompletion(_soundId, nil, nil, { (soundID, clientData) -> Void in
            
            print("音频播放结束之后，重复音频的播放。。。")
            AudioServicesPlaySystemSound(soundID)  //重复音频文件的播放
            
        }, nil)
        
        AudioServicesPlaySystemSound(_soundId)  //开始音频的播放
    }
    
}

