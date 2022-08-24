//
//  ViewController.swift
//  单元格的选择与取消选择
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

//前者用于设置表格的行数和初始化及复用UITableViewCell对象，后者用于具体处理单元格的选择事件
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let diablo3Level = ["普通模式", "困难模式", "高手模式", "大师模式", "痛苦模式"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 20))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }

    //设置表格的行数为游戏难度数组的长度
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return diablo3Level.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if(cell == nil)
            {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                    reuseIdentifier: identifier)
            }
            
            cell?.textLabel?.text = diablo3Level[(indexPath as NSIndexPath).row]
            
            return cell!
    }
    
    //indexPath：被选择的单元格所在的索引位置
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //首先通过表格对象的cellForRowAt indexPath()方法获得在表格对象中被选中的单元格，接着判断被选中的单元格当前的附件类型，若为空，则设置单元格的附件类型为checkmark
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCell.AccessoryType.none {
            
            //UITableViewCell.AccessoryType共有4种类型：.none，.detailButton，.detailDisclosureButton，.disclosureIndicator，.checkmark
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
            print("您选择了：\(String(describing: cell?.textLabel?.text))")
        } else {
            
            //若被点击的单元格对象已处于选中状态，则恢复其附件类型为空
            cell?.accessoryType = UITableViewCell.AccessoryType.none
            print("您取消选择了：\(String(describing: cell?.textLabel?.text))")
        }
    }

}

