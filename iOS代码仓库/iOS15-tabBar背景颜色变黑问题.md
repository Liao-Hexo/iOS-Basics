```swift
//计算tabBar的总个数：self.tabBar.items!.count

// UINavigationBar也是类似处理方法
class HomeUITabBarViewController: UITabBarController, UITabBarControllerDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        if #available(iOS 13.0, *) {
            self.updateTabBarAppearance()
        } else {
            // Fallback on earlier versions
        }
    }

    @available(iOS 13.0, *)
    private func updateTabBarAppearance() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()

        let barTintColor: UIColor = UIColor(named: "supervcBgcolor")!
        tabBarAppearance.backgroundColor = barTintColor

        self.tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            // Fallback on earlier versions
        }
    }
}
```

