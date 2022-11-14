//
//  ViewController.swift
//  UIView动画块和Block动画
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //iOS中的动画实现技术主要是Core Animation和UIKit，两者都可以负责所有的滚动、旋转、缩小和放大以及所有的iOS动画效果
        //其中，UIKit可以看作是对CoreAnimation的封装
        
        //UIView拥有多种动画的实现方式：UIView动画块、UIView的Block动画，甚至包含关键帧动画，使用UIView动画时，可以通过修改以下UIView视图的属性产生平滑的动画效果：frame、bounds、center、transform、alpha、backgroundColor、contentStretch
        
        //UIView动画块、UIView的Block动画
        let rect = CGRect(x: 40, y: 80, width: 240, height: 240)
        let view = UIView(frame: rect)
        view.backgroundColor = UIColor.red
        view.tag = 1  //UIView对象的tag表示该视图对象在父视图中的唯一标识，该视图被添加到父视图时，父视图可以通过viewWithTag(tag: Int)方法快速找到拥有该标识的子视图
        
        self.view.addSubview(view)
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 50, y: 400, width: 220, height: 44)
        button.backgroundColor = UIColor.black
        button.setTitle("Play", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 24)
        
        button.addTarget(self, action: #selector(ViewController.playAnimation), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(button)
    }
    
    /*
    //实现UIView动画的播放
    @objc func playAnimation() {
        
        UIView.beginAnimations(nil, context: nil)  //启动一个动画，动画并不会立即被执行，直到调用UIView类的commitAnimations类方法，对于一个视图对象执行的介于beginAnimations方法跟commitAnimations方法之间的操作，在commitAnimations方法被执行后，才会生成并播放动画
        
        //easeInOut：动画播放速度在开始时较慢，然后逐渐加速，在完成之前再次变慢
        //easeIn：动画播放速度在开始时较慢，然后在动画播放过程中逐渐加速
        //easeOut：动画播放速度在开始时较快，然后在动画播放过程中逐渐减速
        //linear：动画插入速度在动画播放过程中始终保持不变
        UIView.setAnimationCurve(.easeOut)  //设置动画的播放速度变化曲线，该属性默认值为easeInOut
        
        UIView.setAnimationDuration(5)  //设置动画块的的动画持续时间，单位为秒，默认值为0.2
        UIView.setAnimationBeginsFromCurrentState(true)  //设置动画是否从当前状态开始播放，默认值为false
        
        let view = self.view.viewWithTag(1)
        //view?.frame = CGRect(x: 40, y: 40, width: 0, height: 0)
        //view?.backgroundColor = UIColor.blue
        //view?.alpha = 0
        
        //设置自定义的过渡动画效果
        //第一个参数表示过渡效果，第二个参数表示需要应用过渡效果的视图，第三个参数表示是否为视图在过渡前后的画面进行缓存，以提高过渡效果的桢速
        //flipFromLeft：视图从左向右滑入屏幕；flipFromRight：视图从右向左滑入屏幕；curlUp：视图从底部向顶部卷曲的翻页动画；curlDown：视图从顶部向底部卷曲的翻页动画；none：无过渡效果
        UIView.setAnimationTransition(.curlUp, for: view!, cache: true)
        
        UIView.setAnimationDelegate(self)  //设置动画的代理为当前的视图控制器，用来检测动画的播放状态
        UIView.setAnimationDidStop(#selector(ViewController.animationStop))  //设置动画结束时的回调方法
        
        UIView.commitAnimations()  //结束动画块的设置，并开始播放动画
    }
    
    @objc func animationStop()
    {
        print("Animaton stop.")
        self.view.viewWithTag(1)?.removeFromSuperview()
    }
    */
    
    @objc func playAnimation() {
        
        //第一个参数为动画的时长
        //第二个参数为动画延迟时间
        //第三个参数是动画的属性设置
        //第四个参数为动画的主体设置区域
        //第五个参数为动画完成后的回调事件
        UIView.animate(withDuration: 5, delay: 0, options: [.curveEaseOut], animations: {
            
            let view = self.view.viewWithTag(1)
            view?.frame = CGRect(x: 40, y: 40, width: 0, height: 0)
            view?.backgroundColor = UIColor.blue
            view?.alpha = 0
            
        }, completion: { (value: Bool) in
            
            print("Animation stop.")
            self.view.viewWithTag(1)?.removeFromSuperview()
        })

    }
    
}

