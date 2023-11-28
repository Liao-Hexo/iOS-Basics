![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/202311281911675.png)

- App Store Connect：用来发布到App Store，使用发布证书编译
- Ad Hoc：在开发者账号中添加过UDID的设备可以使用，使用发布证书编译
- Enterprise：企业发布，使用企业证书编译
- Development：在开发者账号中添加过UDID的设备可以使用，使用开发证书编译

前期开发测试的时候，Ad Hoc和Development包都可以使用，鉴于Development多一个可以直接连接真机安装的功能，建议首选Development模式创建证书，后期将要发布到App Store上的时候，再创建Ad Hoc证书安装测试，确保最终上架到App Store的应用无Bug。
