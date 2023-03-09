我们通常讲的“Cocoa框架”事实上是一个框架的集合，包含众多子框架，其中最重要的是Foundation和UIKit两个框架。

![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/008vxvgGly1h920nozh09j30kw0bggm2.jpg)

# Foundation框架

Foundation是框架的基础，和界面无关，主要包含大量常用的API，如值对象、集合、文件系统、URL、进程通信、通知、归档和序列化、表达式和条件判断，Foundation框架为所有的应用程序提供基本系统服务。

- 创建和管理字符串
- 创建和管理数组、字典等集合
- 创建日期和时间对象
- 访问存储在应用程序里的图片和其他资源
- 提交和接收通知
- 执行异步操作
- 自动发现IP网络上的设备
- 操作网络请求

# UIKit框架

UIKit框架提供一系列Class类来建立和管理iOS应用程序的用户界面接口、应用程序对象、事件控制、绘图模型、窗口、视图和用于控制触摸屏等的接口，UIKit框架是iOS上的用户图形包，UI开头的类都来自于这个框架。

- 构建和管理应用程序的用户界面
- 捕获触摸和基于移动的交互事件
- 呈现文字和Web内容
- 优化多任务的应用程序
- 创建自定义的界面元素

UIKit中每个视图对象的背后都有一个Core Animation层对象，它是一个CALayer类的实例，该类为视图内容的布局和渲染以及合成和动画提供基础性的支持。

## UIKit和视图对象的交互

1. 在应用程序运行时，用户触摸了设备屏幕
2. 设备将用户的触摸事件传递给UIKit框架
3. UIKit框架将触摸事件封装成UIEvent对象，并根据事件传递机制将该对象传递给合适的视图对象
4. 视图对象对UIEvent事件做出响应：
   - 调整视图及其子视图的frame、alpha等视觉属性
   - setNeedsLayout：将视图及其子视图标识为需要修改布局
   - setNeedsDisplay：将视图及其子视图标识为需要重画布局
   - 将这些变化报告视图控制器
5. 当视图或子视图被标记为setNeedsDisplay需要重画时，UIKit框架就会调用视图的drawRect方法，所有更新过的视图都和其他可视内容进行合成，然后发送给图形硬件进行显示。
6. 最后由图形硬件将渲染完成的视觉内容绘制到设备的屏幕上。

## UIKit框架的类结构

`注意：UIWindow继承自UIView类`

----

# 1.NSObject

## 1.1.UIAcceleration

## 1.2.UIAccelerometer

## 1.3.UIAccessibilityElement

## 1.4.UIBarItem

### 1.4.1.UIBarButtonItem

### 1.4.2.UITabBarItem

## 1.5.UIBeziePath

## 1.6.UIColor

## 1.7.UIDevice

## 1.8.UIDocumentInteractionController

## 1.9.UIEvent

## 1.10.UIFont

## 1.11.UIGestureRecognizer

### 1.11.1.UILongPressGestureRecognizer

### 1.11.2.UIPanGestureRecognizer

### 1.11.3.UIPinchGestureRecognizer

### 1.11.4.UIRotationGestureRecognizer

### 1.11.5.UISwipeGestureRecognizer

### 1.11.6.UITapGestureRecognizer

## 1.12.UIImage

## 1.13.UILocalizedIndexedCollation

## 1.14.UILocalNotification

## 1.15.UIMenuController

## 1.16.UIMenuItem

## 1.17.UINavigationItem

## 1.18.UITouch

## 1.19.UITextRange

## 1.20.UITextPosition

## 1.21.UITextInputStringTokenizer

## 1.22.UITextChecker

## 1.23.UISearchDisplayController

## 1.24.UINib

## 1.25.UIPasteboard

## 1.26.UIPopoverController

## 1.27.UIPrintFormatter

### 1.27.1.UISimpleTextPrintFormatter

### 1.27.2.UIMarkupTextPrintFormatter

### 1.27.3.UIViewPrintFormatter

## 1.28.UIPrintInfo

## 1.29.UIPrintInteractionController

## 1.30.UIPrintPageRenderer

## 1.31.UIPrintPaper

## 1.32.UIResponder

### 1.32.1.UIApplication

### 1.32.2.UIView

#### 1.32.2.1.UIWindow

#### 1.32.2.2.UILabel

#### 1.32.2.3.UIPickerView

#### 1.32.2.4.UIProgressView

#### 1.32.2.5.UIActivityIndicatorView

#### 1.32.2.6.UIImageView

#### 1.32.2.7.UITabBar

#### 1.32.2.8.UIToolbar

#### 1.32.2.9.UINavigationBar

#### 1.32.2.10.UITableViewCell

#### 1.32.2.11.UIActionSheet

#### 1.32.2.12.UIAlertView

#### 1.32.2.13.UIScrollView

##### 1.32.2.13.1.UITableView

##### 1.32.2.13.2.UITextView

#### 1.32.2.14.UISearchBar

#### 1.32.2.15.UIWebView

#### 1.32.2.16.UIControl

##### 1.32.2.16.1.UIButton

##### 1.32.2.16.2.UIDatePicker

##### 1.32.2.16.3.UIPageControl

##### 1.32.2.16.4.UISegmentedControl

##### 1.32.2.16.5.UITextField

##### 1.32.2.16.6.UISlider

##### 1.32.2.16.7.UISwitch

### 1.32.3.UIViewController

#### 1.32.3.1.UISplitViewController

#### 1.32.3.2.UITabBarController

#### 1.32.3.3.UITableViewController

#### 1.32.3.4.UINavigationController

##### 1.32.3.4.1.UIImagePickerController

##### 1.32.3.4.2.UIVideoEditorController

## 1.33.UIScreen

## 1.34.UIScreenMode