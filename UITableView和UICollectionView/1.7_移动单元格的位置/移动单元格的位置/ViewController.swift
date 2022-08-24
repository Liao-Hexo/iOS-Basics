//
//  ViewController.swift
//  移动单元格的位置
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var customers = [
        "[普通客户] 冮炳林",
        "[普通客户] 扶伽霖",
        "[普通客户] 冈皑冰",
        "[金牌客户] 符博富",
        "[普通客户] 范姜臣华"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 20))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.setEditing(true, animated: true)  //当UITableView对象进入编辑模式后，UITableView对象会对所有可见的单元格依次调用tableView(_:canMoveRowAt:)代理方法，判断该单元格是否可以拖动，并且在单元格右侧显示拖动按钮
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                    reuseIdentifier: identifier)
            }
            
            cell?.textLabel?.text = customers[(indexPath as NSIndexPath).row]
            return cell!
    }
    
    //隐藏单元格左侧的编辑按钮
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    //用来设置UITableView视图中的所有单元格都是可以被拖动的
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //当用户松开手指，释放被拖动的单元格时，调用此方法
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //首先获得单元格的原始索引位置和目标索引位置，然后获得在客户数组中被拖动的客户姓名
        let fromRow = (sourceIndexPath as NSIndexPath).row
        let toRow = (destinationIndexPath as NSIndexPath).row
        let customer = customers[fromRow]
        
        //接着调用数组的removeAtIndex:方法删除数组原始位置上的元素
        //最后调用数组的insert(: atIndex)方法将被拖动的客户姓名插入数组中的目标位置，以保持视图层与数据源层的数据同步
        customers.remove(at: fromRow)
        customers.insert(customer, at: toRow)
    }
    
}

