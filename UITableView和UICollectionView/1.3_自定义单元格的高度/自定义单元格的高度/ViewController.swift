//
//  ViewController.swift
//  自定义单元格的高度
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*
    UITableViewDelegate协议的主要用途是提供一些可选的方法，用来控制表格的选择、指定章节的头和尾的显示、单元格内容的复制和粘贴，以及协助完成单元格的排序等功能
     1. tableView(_:heightForRowAt:)：设置指定索引位置上的单元格的高度，每当表格需要显示时，都会调用此方法，用来设置表格中每一行单元格的高度
     2. tableView(_:willDisplay:forRowAt:)：当指定索引位置上的单元格即将显示时，调用此方法。此方法使委托对象有机会在单元格显示之前重写其状态属性，如选择背景颜色等
     3. tableView(_:didSelectRowAt:)：当用户点击选择指定索引位置上的单元格时，调用此方法，可以在此方法中设置单元格选中后的状态，比如添加一个被选中的标志图片
     4. tableView(_:didDeselectRowAt:)：当用户点击一个已被选中的单元格时，调用此方法
     5. tableView(_:viewForHeaderInSection:)：在此方法中设置表格视图指定章节的头部区域视图，可以返回一个UIImageView、UILabel对象或自定义的UIView对象作为章节的头部
     6. tableView(_:viewForFooterInSection:)：在此方法中设置表格视图指定章节的尾部区域视图
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-20))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }
    
    //设置表格视图中指定索引位置的单元格的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //首先通过indexPath.row语句获得需要设置高度的单元格的所在行数，然后设置偶数行的高度为104，奇数行的高度为40
        if (indexPath as NSIndexPath).row % 2 == 0 {
            return 104
        }
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        if (indexPath as NSIndexPath).row % 2 == 0 {
            
            cell?.imageView?.image = UIImage(named: "picture.png")
            cell?.textLabel?.text = ""
        } else {
            
            cell?.imageView?.image = nil
            cell?.textLabel?.text = "每有会意，便欣然忘食！"
        }
        
        return cell!
    }
    
}

