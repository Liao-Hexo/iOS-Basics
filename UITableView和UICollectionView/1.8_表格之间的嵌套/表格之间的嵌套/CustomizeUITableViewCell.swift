//
//  CustomizeUITableViewCell.swift
//  表格之间的嵌套
//
//  Created by 廖家龙 on 2021/7/10.
//

//该表格的偶数行(行数从0开始)为普通的UITableViewCell单元格，用来显示新闻的标题文字
//表格的奇数行为自定义的单元格，该单元格拥有另一个UITableView对象，用来显示网友对新闻的评论信息
import UIKit

class CustomizeUITableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var comments: [String] = []  //添加了一个字符串数组，作为tableView元素的数据源，该数组的初始值为空
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tableView = UITableView(frame: CGRect(x: 20, y: 0, width: 280, height: 90))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isScrollEnabled = false  //禁止tableView的滚动
        
        self.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        
            let identifier = "reusedCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                    reuseIdentifier: identifier)
            }
        
            cell?.textLabel?.text = comments[(indexPath as NSIndexPath).row]
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
            cell?.textLabel?.textColor = UIColor.gray
            cell?.textLabel?.numberOfLines = 0  //表示不限制标签对象中文字的行数，如果不设置此属性，那么无论文字多少，标签对象仅显示一行数据，并在行尾显示省略号的字样
        
            return cell!
    }
    
    //用来设置指定索引位置的单元格的高度，这里根据该单元格将要显示的文字的多少来设置相应的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
        
        let subComments = comments[(indexPath as NSIndexPath).row]  //根据索引位置获得数据源中指定位置的评论信息
        
        let size = subComments.boundingRect(with: CGSize(),
            options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);  //获得绘制该字符串所需的矩形区域的大小
        
        let cellHeight =  size.height*size.width/170  //计算出显示所有评论信息所需要的单元格的高度数值
        
        if cellHeight < 30 {
            return 30
        } else {
            return cellHeight
        }
    }
    
    //当设置表格对象的数据源之后，需要根据数据源中评论信息的文字数量重新设置表格对象的高度数值
    func setCommentsForTable(_ comments:[String]) {
        self.comments = comments
        
        var tableHeight: CGFloat = 0
        
        //通过一个for循环语句把表格中所有的单元格的高度都分别计算一次，然后把结果累加起来作为表格的高度，最后把累加后的高度数值赋予当前的tableView对象
        for i in 0 ..< comments.count {
            
            let size = comments[i].boundingRect(with: CGSize(),
                options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
            tableHeight += size.height*size.width/170
        }
        tableView.frame = CGRect(x: 20, y: 0, width: 280, height: tableHeight + 50)
        
        tableView.reloadData()  //调用该方法可以重新加载表格的数据源，并重新生成表格对象中的所有章节头部标题、章节尾部内容、章节序列以及单元格的内容
    }
    
    func getMyHeight()->CGFloat{
        return tableView.frame.size.height
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(code:)has not brrn implomented");
    }
    
}

