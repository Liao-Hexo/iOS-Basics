## hitTest介绍

`- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event;`

`hitTest`是`UIView`的一个方法，该方法会被系统调用，用于在视图`UIView`层次结构中找到一个最合适的`UIView`来响应触摸事件。我们先来观察以下效果：

[![img](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/68747470733a2f2f747661312e73696e61696d672e636e2f6c617267652f65366339643234656c7931683576677533786661696a3230753031737871376a2e6a7067.jpeg)](https://camo.githubusercontent.com/0a943a0a4cd2cc16aef213593c9306e2fbae20307901a7a64968520099fee140/68747470733a2f2f747661312e73696e61696d672e636e2f6c617267652f65366339643234656c7931683576677533786661696a3230753031737871376a2e6a7067)

可以得出结论：系统默认的处理方式是超出`tabBar`的区域，中间按钮是不响应该事件的，而是由其后视图响应，所以这就需要用到`hitTest`了，`hitTest`的目的是让中间按钮超出`tabBar`部分响应点击事件。

## hitTest的调用顺序

### iOS中的事件分为三类

1. 触摸事件：通过触摸、手势进行触发，例如手指点击、缩放
2. 加速计事件：通过加速器进行触发，例如手机晃动
3. 远程控制事件：通过其他远程设备触发，例如耳机控制按钮

只有继承自`UIResponder`的类才能处理事件，如`UIApplication、UIView、UIViewController`

```objective-c
UIResponder内部提供了以下方法来处理事件触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
加速计事件
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;
远程控制事件
- (void)remoteControlReceivedWithEvent:(UIEvent *)event;
```

### 事件传递过程

Gesture Recognizer：如果视图有事件到来的时候，且视图有附加的手势动作，则手势识别优先处理事件，如果手势识别没有处理事件，则将事件交给视图本身自行处理，视图如果未处理则顺着响应者链继续向后传递。

`touch->UIApplication->UIWindow->UIViewController.view->subViews->...->view`

当用户点击屏幕时，会产生一个触摸事件，系统会将该事件加入到由`UIApplication`管理的事件队列中，`UIApplication`会从事件队列中取出最早的事件进行分发处理，先发送事件给应用程序的主窗口`UIWindow`，主窗口会调用其`hitTest:withEvent:`方法在视图`UIView`层次结构中找到一个最合适的`UIView`来处理触摸事件

```objective-c
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //系统默认会忽略isUserInteractionEnabled设置为NO、隐藏、alpha小于等于0.01的视图
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}
```

![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/008vxvgGly1h9ifil5cynj30hz0biab3.jpg)

1. 首先在当前视图的`hitTest`方法中调用`pointInside`方法判断触摸点是否在当前视图内
2. 若`pointInside`方法返回`NO`，说明触摸点不在当前视图内，则当前视图的`hitTest`返回`nil`，该视图不处理该事件
3. 若`pointInside`方法返回`YES`，说明触摸点在当前视图内，则从最上层的子视图开始，遍历当前视图的所有子视图，调用子视图的`hitTest`方法重复步骤`1-3`，直到有子视图的`hitTest`方法返回非空对象或者全部子视图遍历完毕
4. 若第一次有子视图的`hitTest`方法返回非空对象，则当前视图的`hitTest`方法就返回此对象，处理结束，若所有子视图的`hitTest`方法都返回`nil`，则当前视图的`hitTest`方法返回当前视图本身，最终由该对象处理触摸事件

![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/e6c9d24ely1h5vi88bc69j209w09gglm.jpg)

![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/e6c9d24ely1h5vija2pb3j20fn09twem.jpg)

1. 首先调用`ViewA`的`hitTest`方法，由于触摸点在其范围内，`pointInside`返回`YES`，遍历其子视图，依次调用`ViewB`和`ViewC`的`hitTest`方法
2. 执行`ViewB`的`hitTest`方法，由于触摸点是不在`ViewB`内，其`pointInside`方法返回`NO`，`hitTest`返回`nil`
3. 执行`ViewC`的`hitTest`方法，由于触摸点是在`ViewC`内，其`pointInside`方法返回`YES`，遍历其子视图，依次调用`ViewD`和`ViewE`的`hitTest`方法
4. 执行`ViewD`的`hitTest`方法，由于触摸点是不在`ViewD`内，其`pointInside`方法返回`NO`，所以其`hitTest`返回`nil`
5. 执行`ViewE`的`hitTest`方法，由于触摸点是在 `ViewE`内，其`pointInside`方法返回`YES`，由于其没有子视图了，其`hitTest`返回其本身，最终，由`ViewE`来响应该点击事件

所以在查找第一响应者的时候，有两个核心API，它的原理就是通过不断调用子视图的这两个API完成的：

1. 调用下面的方法，用来获取被用户点击的视图，即第一响应者：`open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?`
2. hitTest方法内部会通过调用下面的方法，来判断用户点击的区域是否在视图上，是则返回true，不是则返回false：`open func point(inside point: CGPoint, with event: UIEvent?) -> Bool`
3. 下面的两个方法是处理控件上的坐标点转换：`open func convert(_ point: CGPoint, to view: UIView?) -> CGPoint`、`open func convert(_ point: CGPoint, from view: UIView?) -> CGPoint`

## 中间按钮不响应事件的原因

[![img](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/68747470733a2f2f747661312e73696e61696d672e636e2f6c617267652f65366339643234656c79316835766a30716e7830356a32307530307530676f672e6a7067.jpeg)](https://camo.githubusercontent.com/06fba87e2b280e4752727878f60d0a349564475ad95da1e11b8a3e94cd1505a8/68747470733a2f2f747661312e73696e61696d672e636e2f6c617267652f65366339643234656c79316835766a30716e7830356a32307530307530676f672e6a7067)

## 解决办法

```swift
//重写tabBar的hitTest方法
override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    //默认UIImageView不能接收触摸事件，因为不允许交互，isUserInteractionEnabled默认为false
    if !self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01 {
        return nil  //这也说明了：如果父控件不能接收点击事件，那么子控件就不可能接收到点击事件，如果父控件的透明度为0或者isHidden为true，那么子控件也是不可见的
    }
  
    if self.addButton.frame.contains(point) {
        return addButton
    } else {
        return super.hitTest(point, with: event)
    }
}
```