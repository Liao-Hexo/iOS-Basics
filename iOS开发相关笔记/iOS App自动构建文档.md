## Jenkins自动构建目标（鼎信管理平台iOS）

1. 需要两个Jenkins任务，分别用于构建出正式包、测试包。
2. 以测试任务为例，在dev分支中提交代码以后，GitLab会自动通知Jenkins开始构建（也可实现GitHub），Jenkins构建成功后会打出ipa包并将ipa包上传到蒲公英服务器，上传完成后不管构建成功还是失败都会向指定邮箱中发送一封通知邮件（支持群发）。
3. 以正式任务为例，在master分支中提交代码以后，Jenkins不会自动构建，必须开发人员手动点击“立即构建”按钮，构建成功后会打出ipa包并将ipa包上传到三台正式服务器以及执行服务器相关脚本进行文件重命名等操作，上传完成后不管构建成功还是失败都会向指定邮箱中发送一封通知邮件（支持群发）。
4. Jenkins服务器不仅支持本地访问，也可以选择通过局域网或外网访问。

## 安装Java

由于Jenkins依赖于Java，所以在安装Jenkins前，需要先检查是否已安装Java环境。

Java下载地址：https://www.java.com/zh-CN/

```shell
java -version

java version "1.8.0_341"
Java(TM) SE Runtime Environment (build 1.8.0_341-b10)
Java HotSpot(TM) 64-Bit Server VM (build 25.341-b10, mixed mode)
```

## 安装Jenkins

1. Homebrew Installer

```shell
brew install jenkins-lts  # 安装最新的LTS版本
brew install jenkins-lts@YOUR_VERSION  # 安装特定的LTS版本
brew upgrade jenkins-lts  # 更新Jenkins版本
brew uninstall jenkins-lts  # 卸载Jenkins

brew services start jenkins-lts  # 启动Jenkins服务
brew services stop jenkins-lts  # 停止Jenkins服务
brew services restart jenkins-lts  # 重新启动Jenkins服务
```

2. 下载jenkins.war包(不推荐)

```shell
下载地址：https://get.jenkins.io/war-stable/

在war包文件夹中执行命令：java -jar jenkins.war

看到日志：Jenkins is fully up and running，在浏览器访问http://localhost:8080网址。
```

安装完成后，通过命令启动Jenkins，然后访问`http://localhost:8080`网址。

## 登录Jenkins

1. 选择“安装推荐的插件”，等待插件安装完成，有的插件可能会安装失败，建议重试，直到把建议安装的都装好。
2. 插件安装完成后会自动跳转到“创建第一个管理员用户”界面，完成注册。
3. 输入命令重启Jenkins，访问`http://localhost:8080`网址，输入账号密码登录。

## 安装iOS插件

系统管理 -> 插件管理 -> 可选插件中搜索`Xcode integration`、`Upload to pgyer`进行安装。

![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qnulyyo4j30gk029dfv.jpg)

![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qnv4rmelj308a024jra.jpg)

## 构建第一个Jenkins任务

1. 点击新建任务按钮，输入一个任务名称，然后选择“构建一个自由风格的软件系统”，点击确定进入配置界面。

2. General模块编写任务描述。

3. 源码管理模块选择Git，填写`Repository URL`(填写HTTP链接，SSH可能需要额外配置)、`Credentials`、`指定分支(为空时代表any)`，Jenkins会根据填写的仓库URL的指定分支来拉取代码进行自动构建。

4. Build Steps模块，点击“增加构建步骤”按钮，选择Xcode插件，如果项目没有使用cocoapods或者第三方库文件都放在Git仓库，那么选择Xcode插件之前不需要选择添加`执行 shell`模块。

5. Xcode插件配置，建议根据个人需求配置：

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qnvz2cefj30bc02zjr9.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r3ge42itj31fa0kqdim.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r3gmqsetj31fa0nk41n.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo1e2koaj30bg0300sm.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo1tmj69j30g4032748.jpg)

   Provisioning profile UUID：`Xcode - 选中Target - Build Settings - 搜索Provisioning Profile`。

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo2clzdbj30pj0h8js9.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo300iizj30g8025mwy.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo3bdib7j30pk03haa1.jpg)

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo3n0cxfj30pk03fjrc.jpg)

6. 构建后操作

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo47n8j7j30qh06d74d.jpg)

   上传应用到蒲公英教程：https://www.pgyer.com/doc/view/jenkins_plugin

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6qo4lpv2dj30qh0em3yl.jpg)
   
7. 点击立即构建按钮开始构建，构建的内容会显示在此文件夹中：`/Users/liaojialong/.jenkins/workspace`。

## Jenkins邮件通知

1. 系统管理 -> 插件管理 -> 可选插件中搜索`Email Extension Template Plugin`进行安装。

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71ekm2yksj30nb03xdg4.jpg)

2. 系统管理 -> 系统配置中填写一些信息：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71bp8ud7pj30qo02v3yg.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71bs2tm81j30qo06wwek.jpg)

   以QQ邮箱为例，这里添加的邮箱密码是授权码，并不是真正的邮箱密码：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71eoqewgsj30oh06u0tr.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71epoitkgj30he04rt93.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71bstqffsj30qo06f3yj.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71bvsaxx4j30qo05idfu.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71bx0q7quj309n0i7mxt.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71by0ljgyj30qu0idjs3.jpg)

   这里可以填写收件邮箱测试一下：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71c1wfv3zj30qu08egly.jpg)

3. 项目配置中增加构建后操作步骤：`Editable Email Notification`

   `Project Recipient List`中可以添加多个QQ邮箱，每个邮箱用英文逗号隔开，支持群发通知邮件

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71c4ln077j30pi05adfy.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71c6wrzp7j30pi0feab7.jpg)

   注意这里要新增`Recipient List`，这里是一个坑：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71c8l97azj30pi0k40tm.jpg)

## 通过局域网/外网访问Jenkins

如果想要实现构建触发器，前提条件是需要让Jenkins可以通过局域网或外网访问（GitHub需要外网、GitLab需要局域网）。

每当Jenkins启动或重启时，会根据`/opt/homebrew/Cellar/jenkins-lts/2.361.1/homebrew.mxcl.jenkins-lts.plist`文件中的内容生成`/Users/liaojialong/Library/LaunchAgents/homebrew.mxcl.jenkins-lts.plist`文件，所以仅需要将第一个plist文件中地址改成`0.0.0.0`，重启Jenkins后就可以在浏览器上用电脑IP地址通过局域网访问了：

![](https://tva1.sinaimg.cn/large/008vxvgGly1h71db3yswgj30qc058dgq.jpg)

将这里的地址也修改下，否则系统管理中会报`反向代理设置有误`：

![](https://tva1.sinaimg.cn/large/008vxvgGly1h71dfjrpxbj30qm03xjrc.jpg)

## Jenkins-Webhook-GitLab

1. 系统管理 -> 插件管理 -> 可选插件中搜索`GitLab Plugin`进行安装。

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71dl2dhyqj30n703vweq.jpg)

2. 项目配置中选择构建触发器，`GitLab webhook URL`复制下来，`GitLab webhook URL`是GitLab通知Jenkins时的请求地址，用来填写到GitLab上：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71dnn8tp0j30ld05paa9.jpg)

   选择某个分支触发自动构建：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71dttd41gj30pu0act90.jpg)

3. 在GitLab项目设置中选择Webhooks：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71dvffb8dj30sx0cbaay.jpg)

   粘贴`GitLab webhook URL`即可：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71dxxjnbpj30qd02ba9y.jpg)

   点击Test按钮，如果报错，仅需要在系统管理 -> 系统配置中将对勾去掉，再Test一下会发现成功了：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71e0d4sxhj30zc04pta4.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71e5ipl5uj30fb02pq2s.jpg)

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h71e6mud90j30qs02y0st.jpg)

## Jenkins-Webhook-GitHub

1. 项目配置中选择构建触发器。

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h74n0pbw0pj30lm08yq3c.jpg)

2. 与GitLab不同的是，GitHub的地址必须是外网能够访问的，否则GitHub无法访问到Jenkins。所以需要先下载`ngrok`软件（下载地址`https://ngrok.com/download`），切换到下载解压好的文件下，使用ngrok启动：

   ```shell
   ./ngrok http 8088  //这里的8088是Jenkins的端口号
   ```

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h74nb2rzhxj31au0i20uu.jpg)

3. 所以GitHub项目Settings -> Webhooks中填写的`Payload URL`地址为：

   ```
   https://5ea2-119-167-30-57.jp.ngrok.io/github-webhook/
   ```

4. 如下图即表示添加成功：

   ![](https://tva1.sinaimg.cn/large/008vxvgGly1h74nfjsr5wj30m10520t4.jpg)

5. 注意：如果ngrok断开以后，一定要删除原来添加的Webhooks重新添加。

## 向三台正式服务器传输ipa包

Jenkins增加构建步骤：`执行shell`

```shell
sh /Users/qd/.jenkins/workspace/jenkins-ipa.sh  //执行Mac电脑的本地脚本文件
```

jenkins-ipa.sh文件脚本内容：

```shell
#1.64
output1=`/usr/local/bin/sshpass -p "zxcvb@1@64" scp -P 40200 /Users/qd/.jenkins/workspace/TopsProSys-iOS-dev/build/TopsProSys.ipa root@172.20.1.64:/usr/local/nginx/html/topsProSys/iOS/topsProSysIOSNew.ipa`

#1.33
output2=`/usr/local/bin/sshpass -p "123@qwer" scp /Users/qd/.jenkins/workspace/TopsProSys-iOS-dev/build/TopsProSys.ipa Administrator@172.20.1.33:D:/Site/topsProSys/topsProSys/iOS`
/usr/local/bin/sshpass -p "123@qwer" ssh Administrator@172.20.1.33 D:/Site/topsProSys/topsProSys/iOS/rename_package.bat

#1.52
output3=`/usr/local/bin/sshpass -p "123@qwer@ts" scp /Users/qd/.jenkins/workspace/TopsProSys-iOS-dev/build/TopsProSys.ipa Administrator@172.20.1.52:D:/apache-tomcat-8.5.58/webapps/app_download/package/topsProSys`
/usr/local/bin/sshpass -p "123@qwer@ts" ssh Administrator@172.20.1.52 D:/apache-tomcat-8.5.58/webapps/app_download/package/topsProSys/rename_package-ios.bat
```

### 1.64服务器

无脚本文件。

### 1.33服务器

rename_package.bat文件脚本内容：

```shell
@echo off
set foramtdate=%date:~0,4%%date:~5,2%%date:~8,2%
set foramthour=%time:~0,2%
if %foramthour% LSS 10 (
    set foramthour=0%time:~1,1%
)
set foramttime=%foramthour%%time:~3,2%%time:~6,2%

cd /d D:\Site\topsProSys\topsProSys\iOS\
if exist topsProSysIOSNew.ipa (
    ren topsProSysIOSNew.ipa topsProSysIOSNew-%foramtdate%%foramttime%.ipa
)
if exist TopsProSys.ipa (
    ren TopsProSys.ipa topsProSysIOSNew.ipa
)
```

### 1.52服务器

rename_package-ios.bat文件脚本内容：

```shell
@echo off
set foramtdate=%date:~0,4%%date:~5,2%%date:~8,2%
set foramthour=%time:~0,2%
if %foramthour% LSS 10 (
    set foramthour=0%time:~1,1%
)
set foramttime=%foramthour%%time:~3,2%%time:~6,2%

cd /d D:\apache-tomcat-8.5.58\webapps\app_download\package\topsProSys\
if exist topsProSysIOSNew.ipa (
    ren topsProSysIOSNew.ipa topsProSysIOSNew-%foramtdate%%foramttime%.ipa
    move D:\apache-tomcat-8.5.58\webapps\app_download\package\topsProSys\topsProSysIOSNew-%foramtdate%%foramttime%.ipa D:\apache-tomcat-8.5.58\webapps\app_download\package\topsProSys\ios历史版本ipa文件
)
if exist TopsProSys.ipa (
    ren TopsProSys.ipa topsProSysIOSNew.ipa
)
```

新建一个Jenkins任务：`updateFile`，拉一下`http://172.20.3.121:7070/luanyongsheng/Tops-APP-UpdateFile.git`仓库代码，执行shell：`sh /Users/qd/.jenkins/workspace/jenkins-updateFile.sh`。

jenkins-updateFile.sh文件脚本内容：

```shell
# 1.52
output1=`/usr/local/bin/sshpass -p "123@qwer@ts" scp -r /Users/qd/.jenkins/workspace/updateFile/iOS/history Administrator@172.20.1.52:D:/apache-tomcat-8.5.58/webapps/app_download/package/topsProSys/iOSUpdateHistory`
output2=`/usr/local/bin/sshpass -p "123@qwer@ts" scp /Users/qd/.jenkins/workspace/updateFile/iOS/index.html Administrator@172.20.1.52:D:/apache-tomcat-8.5.58/webapps/app_download/package/topsProSys/iOSUpdateHistory/index.html`
output3=`/usr/local/bin/sshpass -p "123@qwer@ts" scp /Users/qd/.jenkins/workspace/updateFile/iOS/update.json Administrator@172.20.1.52:D:/apache-tomcat-8.5.58/webapps/app_download/package/topsProSys/update.json`
```

## 构建过程中可能的报错

### requires a provisioning profile with the App Groups feature.

1. 报错原因

   我们先来回顾一下Xcode打包的步骤：

   1. Product -> Archive，构建成功后需要导出ipa包。

      ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r35zed3tj31c30u076v.jpg)

   2. ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r2xqmjh9j31c10u0dhx.jpg)

   3. ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r2ykr5vjj31c10u0jtl.jpg)

   4. ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r2z366adj31c10u075l.jpg)

   5. 导出完成后，我们可以在导出的文件夹下看到一个`ExportOptions.plist`文件，这个文件就是步骤2/3/4三个步骤的配置过程中的设置项。

      ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r2zj9zxpj318g0nagnf.jpg)

   6. 上述步骤2/3/4都应该在Jenkins的Xcode插件中进行配置，这样在Archive成功后，Jenkins也会根据Xcode插件中的配置去生成一个plist文件，而该错误就是由于Jenkins的Xcode插件没有配置好，无法导出正确的plist文件导致的。

      ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r301y0zvj312g0ngq4p.jpg)

2. 解决方法

   Jenkins的Xcode插件进行配置时，在`Code signing & OS X keychain options`选项卡中，选中`Manual signing`，然后配置相应的Bundle ID和Provisioning profile UUID即可(该配置相当于上述步骤4)。

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1h6r30hc5zjj30pj0h874k.jpg)