### isTranslucent属性为false

```swift
self.navigationController?.navigationBar.isTranslucent = false
```

当设置navigationBar.isTranslucent属性为false时，view的区域范围如图所示，(0,0)是以导航栏左下角为参考点的，这个时候上下滑动当前view，导航栏为不透明。![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/008vxvgGly1h8t111c1mlj30i10i9wf4.jpg)

### isTranslucent属性为true

```swift
self.navigationController?.navigationBar.isTranslucent = true
```

当设置navigationBar.isTranslucent属性为true时，view的区域范围如图所示，(0,0)是以导航栏左上角为参考点的，这个时候上下滑动当前view，导航栏透明。若当前界面有一个tableview既想有透明度，又不被导航栏遮住，只能设置tableview的坐标为(0,NavH)

```swift
let NavH: CGFloat = UIScreen.main.bounds.height == 812 ? 84 : 64
```

![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/008vxvgGly1h8t150zanuj30nn0ifjsb.jpg)
