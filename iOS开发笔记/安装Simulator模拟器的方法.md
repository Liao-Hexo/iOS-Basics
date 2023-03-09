1. Xcode安装模拟器速度很慢，而且很容易安装不成功

2. 选择所要安装的系统版本

   ![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/008vxvgGly1h9ichnqeoxj30mz0ew0tk.jpg)

3. 打开控制台，暂停Xcode中的下载，在控制台中输入“download”进行搜索，可以发现下载地址为`https://devimages-cdn.apple.com/downloads/xcode/simulators/com.apple.pkg.iPhoneSimulatorSDK15_2-15.2.1.1643410298.dmg`

   ![](https://raw.githubusercontent.com/Liao-Hexo/image-repository/Description/image-repository/iOS%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0/008vxvgGly1h9icu2yotcj30z80h1acm.jpg)

4. 复制这条链接，在浏览器中打开就可以下载对应版本的模拟器了

5. 下载完成后，前往文件夹：`/Users/liaojialong/Library/Caches/com.apple.dt.Xcode`，右键显示包内容，自己创建一个名为`Downloads`的文件夹，将之前下载好的.dmg安装包放入此文件夹中

6. 打开Xcode下载页面，继续相对应的模拟器版本下载，几分钟后即可安装成功

7. 如果有`.simruntime`文件，只需要将该文件拷贝至此目录中就安装好了：`/Library/Developer/CoreSimulator/Profiles/Runtimes`