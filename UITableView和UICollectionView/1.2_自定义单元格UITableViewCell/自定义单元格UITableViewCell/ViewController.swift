//
//  ViewController.swift
//  自定义单元格UITableViewCell
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-20))
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell: CustomizeUITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell
        
        if cell == nil {
            cell = CustomizeUITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.title?.text = "客户姓名"
        
        return cell!
    }
    
}

