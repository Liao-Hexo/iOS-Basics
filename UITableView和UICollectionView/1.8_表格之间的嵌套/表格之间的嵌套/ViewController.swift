//
//  ViewController.swift
//  表格之间的嵌套
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var articles = [
        "微软有哪些「黑历史」？",
        "苹果有哪些黑科技？",
        "巴宝莉和 Apple TV 强强联手推出天台秀直播"
    ]

    var comments = [

      ["1.Nebraska这个梗是这样的，当年美国很多公司的呼叫中心设在nebraska（原因有两说，一说是战略空军司令部在这，所以电话线路多，一说是中西部的人说话口音比较标准. 我没考证过哪个对，或者是两个都有），那时候AT&T 店大欺客，800只能打长途不能打市话. 所以八十年代各种广告后面附的电话都是除Nebraska以外，然后后面应该还有一个Nebraska专用的号码.",
       "2.鲍尔默一直都是这种画风……",
       "3.见多了我们的cheer leader的表演就不见怪了。内部company meeting上的那些你们没见过，还有billg出演的。还有个嘲讽非windows系统的广告，好像是和Brian Valentine一起演的，那货也是个怪咖，以前Windows的SVP。",
       "4.啦啦........",
       "5.啦啦啦........",
       "6.啦啦啦啦........"],

      ["1.它真的黑，黑出亮。",
       "2.在天朝，购买它所缴纳的消费税可以买一台超级本",
       "3.这家能够操作供应链的公司，想要什么样的显卡、什么样的内存、什么样的SSD都能信手拈来；这够黑吧"],

      ["1.据巴宝莉新闻稿了解，Apple TV在直播过程中将推出购物功能，观众能直接预定秀场上出现的服装。这么看来，这个功能用在国内简直是一大引入点，可以在春晚直播的过程中购买明星同款。",
       "2.这次怎么不用iPhone®拍摄b？"]

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 20))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none  //不显示单元格之间的分隔线，以避免和内层tableView中的单元格分隔线混淆
        
        self.view.addSubview(tableView)
 
    }
    
    //设置单元格的行数为articles数组长度的2倍，这是因为我们创建的表格的偶数行用来显示新闻标题，奇数行用来显示新闻评论
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return articles.count * 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        
            //定义两个字符串变量，表示两种类型的单元格
            //第一种类型的单元格为普通的UITableViewCell单元格，用于显示新闻的标题
            //第二种类型的单元格为自定义的CustomizeUITableViewCell单元格，该单元格包含一个UITableView子元素，用于显示某条新闻所属的所有评论信息
            let cellForArticle = "cellForArticle"
            let cellForComments = "cellForComments"

            var cell1: UITableViewCell?
            var cell2: CustomizeUITableViewCell?
        
            //如果当前单元格是偶数行，就创建普通的UITableViewCell单元格对象，否则就创建CustomizeUITableViewCell类型的单元格
            if (indexPath as NSIndexPath).row % 2 == 0 {
                
                cell1 = tableView.dequeueReusableCell(withIdentifier: cellForArticle)
                
                if cell1 == nil {
                    cell1 = UITableViewCell(style: UITableViewCell.CellStyle.default,
                        reuseIdentifier: cellForArticle)
                }
                
                cell1?.textLabel?.text = articles[(indexPath as NSIndexPath).row/2]
                cell1?.textLabel?.font = UIFont.systemFont(ofSize: 16)
                cell1?.textLabel?.textColor = UIColor.lightGray
                cell1?.backgroundColor = UIColor.black
                return cell1!
                
            } else {
                
                cell2 = tableView.dequeueReusableCell(withIdentifier: cellForComments) as? CustomizeUITableViewCell
                
                if cell2 == nil {
                    cell2 = CustomizeUITableViewCell(style: UITableViewCell.CellStyle.default,
                        reuseIdentifier: cellForComments)
                }
                let subComments = comments[(indexPath as NSIndexPath).row/2]
                
                cell2?.setCommentsForTable(subComments)  //设置自定义单元格中UITableView对象的数据源为刚刚获得的评论数组对象
                return cell2!
            }
            
    }
    
    //设置外层表格的单元格的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //对于用来显示新闻标题的单元格来说，可以将其高度设置为固定值；但是对于用来显示评论信息的单元格来说，其高度应根据评论文字内容的多少而动态变化
        if (indexPath as NSIndexPath).row % 2 == 0 {
            return 40
        } else {
            let subComments = comments[(indexPath as NSIndexPath).row/2]
            var cellHeight:CGFloat = 0
            for i in 0 ..< subComments.count {
                
                let size = subComments[i].boundingRect(with: CGSize(), options: NSStringDrawingOptions.usesFontLeading, attributes: nil, context: nil);
                cellHeight += size.height*(size.width/170)
            }
            
            return cellHeight + 50
        }
    }

}

