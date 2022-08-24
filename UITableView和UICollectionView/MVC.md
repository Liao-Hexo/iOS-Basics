MVC设计模式包括模型(Model)、视图(View)、控制器(Controller)，该模式最先应用于桌面程序的开发

- Model模型是应用程序中用于处理数据逻辑的部分，通常模型对象负责在数据源中存取数据
- View视图是应用程序中处理数据显示的部分，通常视图是根据模型数据创建的
- Controller控制器是应用程序中处理用户交互的部分，通常控制器负责从视图读取数据、控制用户输入，并向模型发送数据

MVC设计模式有助于管理复杂的应用程序，可以在一段时间内专门关注一个方面，例如你可以在不依赖业务逻辑的情况下专注于视图设计。同时，也让应用程序的测试更加容易，简化了分组开发。不同的开发人员可同时开发视图、控制器逻辑和业务逻辑

![](https://tva1.sinaimg.cn/large/008i3skNly1gxfsi2e6xrj31750tyjuc.jpg)
- 数据模型Model通过通知Notification和键值观察KVO机制与控制器Controller间接通信
- 控制器通过设置View的DataSource属性设置视图的数据源，如UITableView
- 视图View通过动作Action Target向视图控制器ViewController报告事件的发生，例如用户点击了视图
- 视图View通过Delegate委托(代理)向视图控制器报告事件的发生，如UIAlertViewDelegate、UITextFieldDelegate