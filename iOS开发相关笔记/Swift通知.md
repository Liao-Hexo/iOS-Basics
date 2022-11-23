### 发送通知

```swift
NotificationCenter.default.post(name: NSNotification.Name("notification"), object: nil)
```

### 接收通知

```swift
NotificationCenter.default.addObserver(self, selector: #selector(requestUpdateClientId), name: NSNotification.Name("notification"), object: nil)

@objc func requestUpdateClientId() {
  
}
```

### 移除通知

```swift
deinit {
    NotificationCenter.default.removeObserver(self)
}
```

