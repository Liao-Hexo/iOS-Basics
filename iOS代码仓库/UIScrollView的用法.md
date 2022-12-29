```swift
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        addScrollView()
    }  
  
    func addScrollView() {
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:         self.view.frame.size.height)
        scrollView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)
        scrollView.indicatorStyle = UIScrollView.IndicatorStyle.black //default：默认灰色光标，black：黑色光标，white：白色光标
        scrollView.bounces = true //滑动到边缘时光标具有反弹效果（光标变短）
        scrollView.isPagingEnabled = true //分页效果
        scrollView.showsVerticalScrollIndicator = true //显示垂直滚动条（默认为true）
        scrollView.showsHorizontalScrollIndicator = true //显示水平滚动条（默认为true）

        //设置UIScrollView的缩放大小（默认缩放大小为1.0）
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 2
        scrollView.bouncesZoom = false //缩放回弹（默认为true，在超出缩放范围会有一个回弹效果）

        scrollView.scrollsToTop = true //点击设备状态栏会自动滚动到顶部
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }

        self.view.addSubview(scrollView)
    }
  
    //scrollView代理方法
    //当用户点击状态栏后，滚动视图是否能够滚动到顶部
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        print("scrollViewShouldScrollToTop")
        return true //返回值：true可以返回到顶端，false不能返回到顶端
    }
  
    //当滚动视图滚动到最顶端后，执行该方法
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop")
    }
    
    //当开始滚动视图时，执行该方法，一次有效滑动只执行一次
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    //当滚动视图完成后，执行该方法，一次有效滑动只执行一次
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
    }
  
    //滑动减速时调用该方法
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating")
    }
    //滚动视图减速完成，滚动将停止时，调用该方法，一次有效滑动只执行一次
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
  
    //当滚动视图动画完成后，调用该方法，如果没有动画，那么该方法将不被调用
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
    }
  
    //滑动scrollView，并且手指离开时执行，一次有效滑动只执行一次(当pagingEnabled属性为true时，不调用该方法)
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging")
    }

}
```

