//
//  CustomizeUITableViewCell.swift
//  自定义单元格UITableViewCell
//
//  Created by 廖家龙 on 2021/7/10.
//

import UIKit

class CustomizeUITableViewCell: UITableViewCell {
    
    var thumbnail: UIImageView!
    var title: UILabel!
    var detail: UIButton!
    
    //重写UITableViewCell类的初始化方式
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.thumbnail = UIImageView(image: UIImage(named: "user"))
        self.thumbnail.center = CGPoint(x: 30, y: 22)
        
        self.title = UILabel(frame: CGRect(x: 80, y: 0, width: 120, height: 40))
        self.title.text = "自定义单元格"
        
        self.detail = UIButton(frame: CGRect(x: 240, y: 8, width: 60, height: 24))
        self.detail.setTitle("详情", for: .normal)
        self.detail.backgroundColor = UIColor.gray
        
        self.detail.addTarget(self, action: #selector(showDetail(_:)), for: UIControl.Event.touchUpInside)
        
        self.addSubview(self.thumbnail)
        self.addSubview(self.title)

        //可能原因：最新的iOS的SDK不再遍历cell的subview去分发事件，而是遍历cell.contentView的subView去分发事件了
        self.contentView.addSubview(self.detail)  //self.addSubview(self.detail)，使用这种添加方式detail的点击事件无效
    }
    
    @objc func showDetail(_ sender: UIButton) {
        print("显示详细信息")
    }
    
    //实现了继承UITableViewCell类所必需的构造方法
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
