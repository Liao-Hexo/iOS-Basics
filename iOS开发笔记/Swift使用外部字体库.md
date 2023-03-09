1. 去网站（http://www.reeji.com）中下载ttf格式的字体文件

2. 并将字体文件导入到字体册App中，目的是方便看字体文件的PostScript名称（在项目中使用的名字并非我们看到的文件名，而是字体库的PostScript名称）

   ![image-20230215224416074](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/image-20230215224416074.png)

3. 将下载好的字体文件导入到项目工程目录中

4. 在info.plist文件中加入Fonts provided by application

   ![image-20230215225106375](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/image-20230215225106375.png)

5. 在Target -> Build Phases -> Copy Bundle Resources中加入字体文件

   ![image-20230215225426108](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/image-20230215225426108.png)

6. 在代码中设置字体

   ```swift
   let titleLabel: UILabel = UILabel()
   let attrString = NSMutableAttributedString(string: "为客户创造价值", attributes: [.obliqueness: 10*CGFloat.pi/180]) //设置字体倾斜
   titleLabel.numberOfLines = 0
   let attr: [NSAttributedString.Key : Any] = [.font: UIFont(name: "ZhenyanGB", size: 20) ?? UIFont.systemFont(ofSize: 20),.foregroundColor: UIColor(red: 0.24, green: 0.42, blue: 0.69,alpha:1)]
   attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
   titleLabel.attributedText = attrString
   topImageView.addSubview(titleLabel)
   titleLabel.snp.makeConstraints { (make) in
       make.left.equalToSuperview().offset(15)
       make.top.equalToSuperview().offset((57 / 375) * screenWidth)
       make.width.equalTo(146.5)
       make.height.equalTo(20)
   }
   ```