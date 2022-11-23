```swift
struct ThemeColor {}

//字体颜色适配
extension ThemeColor {

    static var blackWhiteFontColor: UIColor  {
        if #available(iOS 13.0, *) {
            return UIColor { traitCollection in
                if traitCollection.userInterfaceStyle == .dark {
                    return .white
                } else {
                    return .black
                }
            }
        } else {
            return .black
        }
    }
}
```

