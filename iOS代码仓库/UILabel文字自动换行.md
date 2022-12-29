```swift
label.numberOfLines = 0 //首先设置目标行数为0

//自动截取换行
label.lineBreakMode = .byCharWrapping

//省略头部文字，省略部分用...代替
label.lineBreakMode = .byTruncatingHead

//省略中间部分文字，省略部分用...代替
label.lineBreakMode = .byTruncatingMiddle

//省略尾部文字，省略部分用...代替
label.lineBreakMode = .byTruncatingTail

//将多余的部分截断
label.lineBreakMode = .byClipping

//自动换行（按词拆分）
label.lineBreakMode = .byWordWrapping

//自动换行（按字符拆分）
label.lineBreakMode = .byCharWrapping
```

