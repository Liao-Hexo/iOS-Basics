//
//  ViewController.swift
//  单元格的插入和删除
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

//前者用于设置表格的行数和初始化及复用UITableViewCell对象，后者用于具体处理单元格的插入或删除操作
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var diablo3Level = ["普通模式", "困难模式", "高手模式", "大师模式", "地狱模式"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 20))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.setEditing(true, animated: true)  //表格视图进入编辑模式
        
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return diablo3Level.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                    reuseIdentifier: identifier)
            }
            
            cell?.textLabel?.text = diablo3Level[(indexPath as NSIndexPath).row]
            
            return cell!
    }
    
    //通过实现此方法设置单元格的编辑模式：插入模式或者删除模式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
//        return UITableViewCell.EditingStyle.none
//        return UITableViewCell.EditingStyle.insert
        return UITableViewCell.EditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.insert {
            
            diablo3Level.insert("痛苦模式", at: indexPath.row)  //在表格对象的数据源数组中插入一条新的数据，以保持表格视图与数据源的数据一致性
            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.right)  //在指定索引位置的单元格处插入新的单元格
        }
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            diablo3Level.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.right)
        }
        
    }

}

