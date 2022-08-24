//
//  PageControlViewController.swift
//  视图控制器和UIScrollView
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

//让该类遵循UIScrollViewDelegate协议，从而可以检测滚动视图的状态
class PageControlViewController: UIViewController, UIScrollViewDelegate {
    
    //UIScrollView：UIScrollView是一个能够滚动的视图控件，可以用来展示大量内容，用户可通过在UIScrollView上滑动手指查看多个视图控制器中的内容
    
    //在滚动ScrollView时可通过PageControl中的小白点来观察当前页面的位置，也可通过点击PageControl中的小白点来滚动到指定的页面
    var scrollView = UIScrollView()  //滚动视图对象
    var pageControl = UIPageControl()  //页面控制对象，用它来控制UIScrollView的翻页
    
    var isPageControlUsed = false  //用来判断是否使用了pageControl对象，如果没有使用pageControl对象，而是使用手指滑动scrollView进行内容的滚动查看，则在查看内容时可实时更新pageControl对象的状态

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //获得当前屏幕的frame属性以及相应的宽度和高度信息
        var screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame.size.width
        let screenHeight = screenFrame.size.height
        
        scrollView.frame = screenFrame  //设置scrollView的显示区域与屏幕尺寸相同，以进行全屏显示
        scrollView.isPagingEnabled = true  //即scrollView将以一整页为单位进行翻页操作
        scrollView.contentSize = CGSize(width: screenWidth*2, height: screenHeight)  //因为我们需要scrollView在两个页面中分别显示两个视图控制器的内容
        scrollView.backgroundColor = UIColor.black
        scrollView.delegate = self  //设置scrollView的代理对象为当前的视图控制器对象
        
        //设置pageControl的显示区域位于屏幕的底部
        let pcHeight: CGFloat = 50.0
        let pcRect = CGRect(x: 0, y: screenHeight-pcHeight, width: screenWidth, height: pcHeight)
        
        pageControl.frame = pcRect
        pageControl.numberOfPages = 2  //设置pageControl拥有两个小白点，以标识两页的内容
        pageControl.currentPage = 0  //当前处于第一页
        pageControl.backgroundColor = UIColor.gray
        
        pageControl.addTarget(self, action: #selector(PageControlViewController.pageControlDidChanged(_:)), for: UIControl.Event.valueChanged)
        
        //FirstViewController对象将位于scrollView中的第一页
        let firstController = FirstViewController()
        screenFrame.origin.x = 0
        firstController.view.frame = screenFrame
        
        //SecondViewController对象将位于scrollView中的第二页
        let secondController = SecondViewController()
        screenFrame.origin.x = screenFrame.size.width
        secondController.view.frame = screenFrame
        
        scrollView.addSubview(firstController.view)
        scrollView.addSubview(secondController.view)
        
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        
    }
    
    @objc func pageControlDidChanged(_ sender: AnyObject) {
        
        let crtPage = (CGFloat)(pageControl.currentPage)  //首先获得pageControl对象当前的页码
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * crtPage
        frame.origin.y = 0
        
        scrollView.scrollRectToVisible(frame, animated: true)  //将scrollView滚动到目标区域
        isPageControlUsed = true
    }
    
    //实现UIScrollViewDelegate协议中的scrollViewDidScroll方法，当用户使用手指滑动scrollView时将调用该方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if !isPageControlUsed {  //首先判断是否通过用户的手指进行scrollView的滑动
            
            //如果是，就监控scrollView在水平方向上的偏移值，当scrollView在水平方向上被拖动超过屏幕宽度一半距离时，计算pageControl对应的页码
            let pageWidth = scrollView.frame.size.width
            let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
            pageControl.currentPage = Int(page)
        }
    }
    
    //实现UIScrollViewDelegate协议中的scrollViewDidEndDecelerating方法
    //该方法将在scrollView减速至停止滚动时被调用
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isPageControlUsed = false
    }
    
    //最后别忘了设置默认启动界面！

}
