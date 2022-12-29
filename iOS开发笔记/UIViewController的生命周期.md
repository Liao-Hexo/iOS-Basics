### UIViewController的生命周期

当视图的可见性发生改变时，视图控制器会自动调用相应的状态转变方法：

- `alloc`：创建一个视图控制器对象，并分配内存空间。
- `init()`：对视图控制器对象进行初始化操作。
- `loadView`：如果从故事版文件创建视图，就从故事版中加载视图；当访问视图控制器的view属性时，如果view此时是nil，那么视图控制器会自动调用loadView方法来初始化一个UIView视图，并赋值给view属性。
- `viewDidLoad`：视图控制器的视图对象在载入内存之后调用此方法，可以对视图进行一些自定义操作。
- `viewDidUnload`：如果内存不够，一些没有处于显示状态的视图控制器就会收到内存不够的警告，然后自动释放自己拥有的视图，以达到释放内存的目的。
- `viewWillAppear`：视图将要被展示在屏幕上，我们通常使用这个方法对即将显示的视图做进一步处理，如根据设备不同的朝向对视图进行不同的设置。另外，当从一个视图返回当前视图时，并不会重复调用viewDidLoad方法，如果此时需要对界面进行更新，就需要在viewWillAppear方法中实现。
- `viewDidAppear`：视图已经在屏幕上完成渲染操作并正确显示，在视图被添加到视图层级中显示时调用，为了加快应用的响应速度，我们可以将界面首先显示出来，然后将一些长时间的操作放在界面显示之后进行，比如在显示完旧邮件的列表之后，再去读取服务器最新的邮件。
- `viewWillLayoutSubviews`：视图即将布局其子视图，比如视图的bounds属性改变后，要调整子视图的位置。
- `viewDidLayputSubviews`：视图已经完成子视图的布局操作。
- `viewWillDisappear`：视图即将从父视图中移除，此时还没有调用子视图的`removeFromSuperview`方法。
- `viewDidDisappear`：视图已经从父视图中移除，此时已经完成`removeFromSuperview`方法的调用。
- `dealloc`：视图被销毁。

最后还要考虑一个重要的情况：内存不足警告，当程序收到内存警告的时候，会调用每一个`ViewController`的`didReceiveMemoryWarning`方法，我们需要做出反应，释放程序中暂时不需要的资源。

### UIViewController页面销毁和释放资源

UIViewController的生命周期有个奇怪的地方，就是有页面加载的方法 `viewDidLoad()`，却没有页面销毁的方法，只有一个 `deinit{}`，它代表的是对象的销毁。然而关闭页面时，对象不一定会销毁。如果在`deinit{}`里面去释放资源，资源没释放导致内存泄漏，那么`deinit{}`不会被调用；`deinit{}`不被调用就释放不了资源。这就造成了死循环。

解决方式是重新找一个页面销毁的方法：`viewDidDisappear(_ animated: Bool)`，当然这个方法被调用时页面不一定被销毁了，也可能是在当前页面上面启动了新页面。区分这两种情况的方法是判断当前页面的 `navigationController == nil`，是 `nil` 代表当前页面真正销毁。

```swift
override func viewDidDisappear(_ animated: Bool) {
    if self.navigationController == nil {
        viewDidClose()
    }
}
    
//页面真正销毁
open func viewDidClose() {
    // no op
}
```

