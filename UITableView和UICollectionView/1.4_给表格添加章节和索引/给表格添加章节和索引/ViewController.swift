//
//  ViewController.swift
//  给表格添加章节和索引
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    /*
     1. numberOfSectionsInTableView(_:)：设置表格视图中章节的数量，默认值为1，如果需要添加多个章节，只需返回一个更大的整数即可
     2. sectionIndexTitlesForTableView(_:)：设置在表格右侧显示的索引序列的内容，返回结果为一个字符串数组
     */
    
    //前面制作的表格的数据源都是数组常量，现在演示将一个字典对象作为表格的数据源
    //字典对象的键作为UITableView的Section，字典对象的值(数组)作为Section中单元格的内容
    //字典对象的键A~Z将作为章节的标题，键对应的值将作为所在章节的单元格的内容
    var countries: Dictionary<String, [String]> = [
        "A": ["Afghanistan", "Albania", "Algeria", "Angola", "Australia", "Austria", "Azerbaijan"],
        "B": ["Bangladesh", "Belgium", "Bhutan", "Bolivia", "Brazil", "Bahrain", "Bulgaria"],
        "C": ["Canada", "Congo", "Chile", "China", "Colombia", "Cuba"],
        "D": ["Denmark", "Djibouti", "Dominica"],
        "E": ["Egypt", "Estonia", "Ethiopia"],
        "F": ["Fiji", "Finland", "France"],
        "G": ["Gambia", "Germany", "Greece"],
        "H": ["Haiti", "Honduras", "Hungary"],
        "I": ["India", "Indonesia", "Iran", "Ireland", "Iraq", "Italy"],
        "J": ["Jordan", "Japan"],
        "K": ["Kazakhstan", "Korea", "Kuwait"],
        "L": ["Laos", "Libya", "Lebanon"],
        "M": ["Madagascar", "Morocco", "Malaysia", "Mexico", "Mali", "Mozambique"],
        "N": ["Nepal", "Netherlands", "Nigeria", "New Zealand"],
        "O": ["Oman"],
        "P": ["Pakistan", "Panama", "Philippines", "Portugal"],
        "Q": ["Qatar"],
        "R": ["Romania", "South Africa", "Russia"],
        "S": ["Serbia & Montenegro", "Senegal", "Singapore", "Somalia", "Switzerland"],
        "T": ["Thailand", "Turkmenistan", "Tunisia", "Turkey"],
        "U": ["United Arab Emirates", "United States of America", "Uzbekistan"],
        "V": ["Vanuatu", "Venezuela", "Vietnam"],
        "Y": ["Yemen"],
        "Z": ["Zambia", "Zimbabwe"]
    ]
    
    var keys: [String] = []  //它将用来存储按升序排列后的键名序列，这个数组的长度将作为表格中章节的数目

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //带有索引的表格和普通的表格的外观基本相同，唯一的区别是在表格的右侧显示了一个索引序列，通过点击索引序列可以在表格中快速定位到指定的位置，尤其是当表格拥有大量数据的时候
        
        keys = Array(countries.keys).sorted()  //获得countries字典对象所有的键名，并转化为一个数组对象，由于字典对象的键名是无序排列的，因此接着又调用了数组对象的sorted()方法对数组进行升序排列

        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 20))
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    //返回键名数组的长度作为表格中章节的数目
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    //在该代理方法中，首先根据section参数获得keys数组中的键名，然后根据键名获得字典对象中键名对应的键值，即国家名称的数组，最后返回数组的长度作为指定章节的单元格数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let subCountries = countries[keys[section]]
        return (subCountries?.count)!
    }
    
    //该代理方法用来设置指定章节的标题文字
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    //该代理方法用来设置表格右侧索引序列的内容
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        //首先根据IndexPath参数的section值获得当前单元格所在的章节序号，然后根据章节序号获得键名数组keys中指定位置的键名，
        //再根据键名获得键名在字典对象countries中的键值，也就是一个由国家名称组成的数组
        let subCountries = countries[keys[(indexPath as NSIndexPath).section]]
        //接着根据IndexPath参数的row值获得当前单元格所在章节中的行号，再根据行号获得对应的国家名称，最后设置单元格UILabel属性的值为对应的国家名称
        cell?.textLabel?.text = subCountries![(indexPath as NSIndexPath).row]
        
        return cell!
    }

}

