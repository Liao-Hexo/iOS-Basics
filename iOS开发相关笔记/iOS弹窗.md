```swift
//因为UIViewController继承自UIResponder，所以在UIViewController中可以直接使用self调用
self.show(text: "清理成功")
```

```swift
import Foundation
import UIKit

extension UIResponder {
    
    //MARK: -加载框 不带文字
    func showLoading(isSupportClick: Bool? = false) {
        if Thread.isMainThread {
            SwiftLoadingTool.showLoading(text: nil, isClickHidden: isSupportClick)
        } else {
            DispatchQueue.main.async {
                self.showLoading(isSupportClick: isSupportClick)
            }
        }
    }
    
    //MARK: -加载框 带文字
    func showLoading(text: String? = nil, isSupportClick: Bool? = false) {
        if Thread.isMainThread {
            SwiftLoadingTool.showLoading(text: text, isClickHidden: isSupportClick)
        } else {
            DispatchQueue.main.async {
                self.showLoading(text: text, isSupportClick: isSupportClick)
            }
        }
    }
    
    //MARK: -进度框 带文字
    func showProgressLoading(text: String? = nil, isSupportClick: Bool? = false) {
        if Thread.isMainThread {
            let tool = SwiftLoadingTool.initTool
            if SwiftLoadingTool.isShowingLoading{
                tool.updateLabelFrame(text:text, maxSize:  CGSize.init(width: SwiftLoadingTool.loadTextViewWH - 10.0, height: SwiftLoadingTool.singleRowHeight))
            }else{
                SwiftLoadingTool.showLoading(text: text, isClickHidden: isSupportClick)
                SwiftLoadingTool.isShowingLoading = true
            }
        } else {
            DispatchQueue.main.async {
                self.showProgressLoading(text: text, isSupportClick: isSupportClick)
            }
        }
    }
    
    //MARK: -提示框
    func show(text: String?, hiddenTime: Double = SwiftLoadingTool.autoHiddenTime) {
        if Thread.isMainThread {
            SwiftLoadingTool.show(text: text, hiddenTime: hiddenTime)
        } else {
            DispatchQueue.main.async {
                self.show(text: text)
            }
        }
    }
    
    //MARK: -提示框
    func showGray(text: String?, hiddenTime: Double = SwiftLoadingTool.autoHiddenTime) {
        if Thread.isMainThread {
            SwiftLoadingTool.show(text: text,backgroundColor:.gray,textColor:.black, hiddenTime: hiddenTime)
        } else {
            DispatchQueue.main.async {
                self.showGray(text: text)
            }
        }
    }
    
    //MARK: -隐藏所有HUD
    func hideHUD() {
        if Thread.isMainThread {
            SwiftLoadingTool.hidden()
        } else {
            DispatchQueue.main.async {
                self.hideHUD()
            }
        }
    }
}

let kScreenWidth: CGFloat = UIScreen.main.bounds.width
let kScreenHeight: CGFloat = UIScreen.main.bounds.height

enum LoadingPositionType {
    case centerType, bottomType
}

class SwiftLoadingTool: UIView {
    
    static let initTool: SwiftLoadingTool = SwiftLoadingTool.initView()
    
    // MARK: -文字框属性设置
    static let singleRowHeight: CGFloat = 35.0  //单行高度
    static let minTextWidth: CGFloat = 100.0  //最小文字宽度
    static let maxTextWidth: CGFloat = kScreenWidth - 100.0  //最大文字宽度
    static var isAutoHidden: Bool = true  //是否自动隐藏 对文字框有效 默认自动隐藏
    static var autoHiddenTime: Double = 3.0  //自动隐藏时间 对文字框有效 默认1秒隐藏 需要先设置isAutoHidden属性
    static var positionType: LoadingPositionType = LoadingPositionType.centerType  //展示位置 对文字框有效 默认在中间
    static var textCornerRadius: CGFloat = 5.0  //文字框圆角大小 默认5
    static var textViewBgColor: UIColor = UIColor.black  //文字框背景颜色 黑色
    static var fontSize: CGFloat = 14.0  //文字大小
    static var textColor: UIColor = UIColor.white  //文字颜色
    
    // MARK: -菊花框属性设置
    static let loadViewWH: CGFloat = 75.0  //加载菊花大小
    static let loadTextViewWH: CGFloat = 100.0  //加载菊花大小 带文字
    static var loadViewCornerRadius: CGFloat = 10.0  //菊花框圆角大小 默认10.0
    
    // MARK: -私有属性
    private let tooltag = 121212  //控件tag值
    private var isClickHidden: Bool = false  //是否点击隐藏 默认为NO
    private var isShowLoading: Bool = true  //是否展示loading
    private var isHiddenBefore: (()->Void)?  //是否已隐藏之前的控件
    
    static var isShowingLoading = false
    
    //是否已经存在提示框
    lazy var isAleradlyExit: Bool = {
        let fatherWindow = UIApplication.shared.keyWindow
        return fatherWindow?.viewWithTag(tooltag) != nil
    }()
    
    //初始化
    class func initView() -> SwiftLoadingTool {
        let tool = SwiftLoadingTool.init(frame: UIScreen.main.bounds)
        tool.tag = tool.tooltag
        if #available(iOS 11.0, *) {
            tool.backgroundColor = UIColor(named: "loadToolColor")
        } else {
            tool.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        }
//        tool.backgroundColor = UIColor.clear
        tool.alpha = 0.0
        return tool
    }
    
    //MARK: -展示加载菊花 是否支持点击取消 默认为可不支持点击取消
    static func showLoading(text: String?, isClickHidden: Bool? = false) {
        
        SwiftLoadingTool.hidden {
            
            let tool = SwiftLoadingTool.initTool
            tool.isShowLoading = true
            if let isClickHidden = isClickHidden {
                tool.isClickHidden = isClickHidden
            }
            
            let fatherWindow = UIApplication.shared.keyWindow
            fatherWindow?.addSubview(tool)
            if let text = text {
                
                // 菊花
                tool.loadingTool.center = CGPoint.init(x: SwiftLoadingTool.loadTextViewWH / 2.0, y: SwiftLoadingTool.loadTextViewWH / 2.0 - 10.0)
                tool.loadingTextView.addSubview(tool.loadingTool)
                tool.addSubview(tool.loadingTextView)
                
                // 文字
                tool.alertLabel.backgroundColor = UIColor.clear
                tool.updateLabelFrame(text: text, maxSize: CGSize.init(width: SwiftLoadingTool.loadTextViewWH - 10.0, height: SwiftLoadingTool.singleRowHeight))
                
                tool.alertLabel.center = CGPoint.init(x: SwiftLoadingTool.loadTextViewWH / 2.0, y: SwiftLoadingTool.loadTextViewWH / 2.0 + 30.0)
                tool.loadingTextView.addSubview(tool.alertLabel)
                
            } else {
                
                // 菊花
                tool.loadingTool.center = CGPoint.init(x: SwiftLoadingTool.loadViewWH / 2.0, y: SwiftLoadingTool.loadViewWH / 2.0)
                tool.loadingView.addSubview(tool.loadingTool)
                
                tool.addSubview(tool.loadingView)
            }
            tool.loadingTool.startAnimating()
            
            UIView.animate(withDuration: 0.3) {
                
                tool.alpha = 1.0
                
                if let _ = text {
                    
                    tool.loadingTextView.alpha = tool.alpha
                    tool.alertLabel.alpha = tool.alpha
                    
                } else {
                    
                    tool.loadingView.alpha = tool.alpha
                }
            }
        }
    }
    
    //MARK: -展示加载文字
    static func show(text: String?,backgroundColor:UIColor = SwiftLoadingTool.textViewBgColor,textColor:UIColor = SwiftLoadingTool.textColor, hiddenTime: Double = SwiftLoadingTool.autoHiddenTime) {
        SwiftLoadingTool.hidden {
            let tool = SwiftLoadingTool.initTool
            let fatherWindow = UIApplication.shared.keyWindow
            fatherWindow?.addSubview(tool)
            
            // 文字
            tool.alertLabel.backgroundColor = backgroundColor
            tool.alertLabel.textColor = textColor
            tool.addSubview(tool.alertLabel)
            tool.updateLabelFrame(text: text, maxSize: CGSize.init(width: SwiftLoadingTool.maxTextWidth, height: kScreenHeight))
            
            if SwiftLoadingTool.positionType == .centerType {
                
                tool.alertLabel.center = CGPoint.init(x: kScreenWidth / 2.0, y: kScreenHeight / 2.0)
                
            } else {
                
                tool.alertLabel.center = CGPoint.init(x: kScreenWidth / 2.0, y: kScreenHeight - tool.alertLabel.frame.size.height - 60.0)
            }
            SwiftLoadingTool.initTool.isClickHidden = true // 支持点击时隐藏toast
            
            UIView.animate(withDuration: 0.3, animations: {
                
                tool.alpha = 1.0
                tool.alertLabel.alpha = tool.alpha
                
            }) { (isOk) in
                
                if SwiftLoadingTool.isAutoHidden {
                    self.perform(#selector(hidden), with: nil, afterDelay: hiddenTime)
                }
            }
        }
    }
    
    //MARK: -隐藏所有
    @objc static func hidden(isCompetion: (()->Void)? = nil) {
        SwiftLoadingTool.isShowingLoading = false
        let tool = SwiftLoadingTool.initTool
        tool.isHiddenBefore = isCompetion
        
        if tool.isShowLoading {
            tool.loadingTool.stopAnimating()
        }
        UIView.animate(withDuration: 0.3, animations: {
            tool.alpha = 0.0
            tool.alertLabel.alpha = tool.alpha
            if tool.isShowLoading {
                tool.loadingTextView.alpha = tool.alpha
                tool.loadingView.alpha = tool.alpha
                tool.isShowLoading = false
            }
            
        }) { (isOk) in
            tool.removeFromSuperview()
            tool.isHiddenBefore?()
        }
    }
    
    //更新大小
    func updateLabelFrame(text: String?, maxSize: CGSize) {
        
        let tool = SwiftLoadingTool.initTool
        let size = text?.getSize(maxSize: maxSize)
        var newTextFrame = tool.alertLabel.frame
        newTextFrame.size.width = size!.width
        newTextFrame.size.height = size!.height
        tool.alertLabel.frame = newTextFrame
        tool.alertLabel.text = text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if SwiftLoadingTool.initTool.isClickHidden {
            SwiftLoadingTool.hidden()
        }
    }
    
    //MARK: -懒加载
    //文字提示框
    lazy var alertLabel: UILabel = {
        let label = UILabel.init()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: SwiftLoadingTool.fontSize)
        label.textColor = SwiftLoadingTool.textColor
        
        label.layer.cornerRadius = SwiftLoadingTool.textCornerRadius
        label.layer.masksToBounds = true
        
        return label
    }()
    //加载等待框 带文字
    lazy var loadingTextView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: SwiftLoadingTool.loadTextViewWH, height: SwiftLoadingTool.loadTextViewWH))
        view.center = CGPoint.init(x: kScreenWidth / 2.0, y: kScreenHeight / 2.0)
        view.backgroundColor = SwiftLoadingTool.textViewBgColor
        view.layer.cornerRadius = SwiftLoadingTool.loadViewCornerRadius
        view.layer.masksToBounds = true
        
        return view
    }()
    //加载等待框
    lazy var loadingView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: SwiftLoadingTool.loadViewWH, height: SwiftLoadingTool.loadViewWH))
        view.center = CGPoint.init(x: kScreenWidth / 2.0, y: kScreenHeight / 2.0)
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = SwiftLoadingTool.loadViewCornerRadius
        view.layer.masksToBounds = true
        
        return view
    }()
    //系统菊花
    lazy var loadingTool: UIActivityIndicatorView = {
        let tool = UIActivityIndicatorView.init(style: .whiteLarge)
        tool.hidesWhenStopped = true
        
        return tool
    }()
}

extension String {
    
    func getSize(maxSize: CGSize) -> CGSize {
        
        if self.isEmpty {
            return CGSize.init(width: SwiftLoadingTool.minTextWidth, height: SwiftLoadingTool.singleRowHeight)
        }
        let str: NSString = NSString.init(string: self)
        var rect = str.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: SwiftLoadingTool.fontSize)], context: nil)
        
        rect.size.width < SwiftLoadingTool.minTextWidth ? (rect.size.width = SwiftLoadingTool.minTextWidth) : (rect.size.width += 15.0)
        
        rect.size.height < SwiftLoadingTool.singleRowHeight ? (rect.size.height = SwiftLoadingTool.singleRowHeight) : (rect.size.height += 8.0)
        
        return rect.size
    }
}
```

