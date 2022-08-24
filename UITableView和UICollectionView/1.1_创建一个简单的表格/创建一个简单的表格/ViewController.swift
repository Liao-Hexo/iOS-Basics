//
//  ViewController.swift
//  创建一个简单的表格
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

//添加协议，主要用来给UITableView表格提供数据来源，并用来处理数据源的变化
class ViewController: UIViewController, UITableViewDataSource {
    
    /*
     UITableViewDatasource主要的代理方法：
     1. tableView(_:cellForRowAt:)：初始化和复用指定索引位置的单元格（必须实现）
     2. tableView(_:numberOfRowsInSection:)：设置某一章节中的单元格行数，默认值为1（必须实现）
     3. numberOfSections(in:)：设置表格中章节的数量
     4. tableView(_:titleForHeaderInSection:)：设置表格中指定章节的标题文字，若此代理方法返回值为nil，则章节不显示标题
     5. tableView(_:canEditRowAt:)：设置表格中指定索引位置的单元格是否可以被编辑，可以编辑的单元格会显示插入和删除图标
     6. tableView(_:commit:forRowAt:)：当完成插入和删除操作时调用此方法
     7. tableView(_:canMoveRowAt:)：设置指定索引路径的单元格是否可通过拖动的方式改变其位置
     8. tableView(_:moveRowAt:to:)：当单元格被从一个位置拖动到另一位置时，调用此方法
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UITableView用于在一栏内显示一系列对象，它是UIScorllView的子类，UIScorllView可以在任意方向上滑动内容，而UITableView仅支持在垂直方向上的滑动
        //UITableView由单元格UITableViewCell组成，UITableView中的内容都是由UITableViewCell负责显示的，UITableView的行数(即UITableViewCell对象的数量)不受限制，仅由设备的内存决定
        
        let screenRect = UIScreen.main.bounds  //获得当前设备的屏幕尺寸
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height-20)
        let tableView = UITableView(frame: tableRect)
        
        tableView.dataSource = self  //设置UITableView对象的数据源为当前的视图控制器对象，即由当前的视图控制对象实现数据源协议中定义的各种代理方法
        
        self.view.addSubview(tableView)
    }
    
    //由于表格默认拥有一个章节，因此在此设置了默认章节具有20行数据
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    //初始化和复用单元格，每当表格对象需要绘制一个单元格时，都会调用该方法
    //UITableView的复用机制
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"  //作为单元格的类型
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)  //从单元格对象池中获取指定类型并且可以重复使用的单元格
        
        //当创建一个单元格时，你可以自定义一个单元格，或者使用系统预定义的几种单元格格式，系统预定义的单元格样式包含固定样式的标签、图标等对象，使用预定义的单元格只需为标签和图标提供对应的文字内容和图像内容即可，可以使用textLabel和detailTextLabel属性来设置单元格的文字内容，使用imageView属性来设置单元格的图标
        
        //UITableViewCell.CellStyle.default：包含一个位于单元格左侧的可选图像视图和一个左对齐的标签对象
        //UITableViewCell.CellStyle.value1：包含一个位于单元格左侧的可选图像视图和一个左对齐的标签对象，在单元格的右侧还有一个灰色、右对齐的标签对象
        //UITableViewCell.CellStyle.value2：包含一个位于单元格左侧的、右对齐的、蓝色文字的标签对象和一个位于右侧的左对齐标签对象
        //UITableViewCell.CellStyle.subtitle：包含一个位于单元格左侧的可选图像视图和一个左对齐的标签对象，在该标签对象下方还有一个字体较小的标签对象
        
        //若从对象池中获得的可复用单元格为nil，则从内存中创建一个新的单元格UITableViewCell对象
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)  //reuseIdentifier：作为一个字符串类型的参数，它是用来标识具有相同类型的、可复用的单元格，对于相同类型的单元格，需要使用相同的reuseIdentifier参数
        }
        
        cell?.textLabel?.text = "命运负责洗牌，玩牌的是我们自己！"
        cell?.detailTextLabel?.text = "test"
        
        return cell!
    }
    
}

