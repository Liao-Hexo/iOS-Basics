```swift
let appDeleagte = UIApplication.shared.delegate as! AppDelegate

if #available(iOS 16.0, *) {
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    if windowScene?.interfaceOrientation == .portrait {
        appDeleagte.type = .landscapeRight
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
        self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
    } else if windowScene?.interfaceOrientation == .landscapeRight {
        appDeleagte.type = .portrait
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
        self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
    }
} else {
    if Device().orientation == Device.Orientation.portrait{
        appDeleagte.type = .landscapeRight
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }else if Device().orientation == Device.Orientation.landscape{
        appDeleagte.type = .portrait
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}
```

