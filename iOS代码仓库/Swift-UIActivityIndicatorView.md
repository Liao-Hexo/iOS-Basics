```swift
import UIKit

class ViewController: UIViewController {
  
    var activityIndicatorView: UIActivityIndicatorView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView = UIActivityIndicatorView(style: .gray) //设置环形滚动条的样式
        activityIndicatorView.color = UIColor.red
        activityIndicatorView.backgroundColor = UIColor.black
        activityIndicatorView.center = self.view.center
        
        activityIndicatorView.hidesWhenStopped = false //停止转圈时隐藏(默认为true)
      
        self.view.addSubview(activityIndicatorView)
        //self.activityIndicatorView.removeFromSuperview()
      
        play()
      
        let Tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.stop))
        Tap.numberOfTapsRequired = 1
        Tap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(Tap)
    }
  
    func play() {
        
        activityIndicatorView.startAnimating() //开始转动
        print(activityIndicatorView.isAnimating) //显示当前状态
    }
  
    @objc func stop() {
        
        activityIndicatorView.stopAnimating() //停止转动
        print(activityIndicatorView.isAnimating) //显示当前状态
    } 
}
```

```swift
private lazy var activityIndicatorView: UIActivityIndicatorView = {
    let activityIndicatorView = UIActivityIndicatorView()
    if #available(iOS 13.0, *) {
        activityIndicatorView.style = .large
    } else {
        activityIndicatorView.style = .gray
    }
    activityIndicatorView.backgroundColor = ThemeColor.whiteBGColor
    activityIndicatorView.frame = CGRect(x: screenWidth / 2 - 25, y: kScreenHeight / 2 - 125, width: 50, height: 50)
    activityIndicatorView.hidesWhenStopped = true
    return activityIndicatorView
}()

self.view.isUserInteractionEnabled = false
```