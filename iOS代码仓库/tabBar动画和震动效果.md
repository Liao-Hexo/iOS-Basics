```swift
import AudioToolbox

func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    tabBarButtonClick(tabBarButton: getTabBarButton())
}
    
private func getTabBarButton() -> UIControl {

    var tabBarButtons = Array<UIView>()
    for tabBarButton in tabBar.subviews {
        if (tabBarButton.isKind(of:NSClassFromString("UITabBarButton")!)){
            tabBarButtons.append(tabBarButton)
        }
    }
    return tabBarButtons[selectedIndex] as! UIControl
}
    
private func tabBarButtonClick(tabBarButton : UIControl) {
        
    for imageView in tabBarButton.subviews {
        if (imageView.isKind(of: NSClassFromString("UITabBarSwappableImageView")!)){
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.duration = 0.3
            animation.calculationMode = CAAnimationCalculationMode(rawValue: "cubicPaced")
            animation.values = [1.0,1.1,0.9,1.0]
            imageView.layer.add(animation, forKey: nil)
        }
    }
    
    //kSystemSoundID_Vibrate：标准长震动
    //1519：普通短震，3D Touch中Peek震动反馈
    //1520：普通短震，3D Touch中Pop震动反馈，home键的震动
    //1521：连续三次短震
    let soundID = SystemSoundID(1519)
    AudioServicesPlaySystemSound(soundID)  //执行震动
}
```

