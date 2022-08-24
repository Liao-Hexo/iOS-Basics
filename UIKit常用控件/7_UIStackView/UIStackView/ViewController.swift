//
//  ViewController.swift
//  UIStackView
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!  //作为视图的布局容器

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIStackView的主要功能不是用来展示内容的，而是用来组织、布局显示内容的视图
        
        //UIStackView类的主要属性：
        //axis属性：用于定义子视图的排列方向，横向或纵向
        //spacing属性：用来控制子视图的间距
        //alignment属性：用来定义子视图之间沿着axis方向的对齐方式，如顶部对齐、底部对齐、左对齐
        //distribution属性：用来定义子视图沿着axis排列的布局规则
        
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        view1.backgroundColor = .red
        view2.backgroundColor = .orange
        view3.backgroundColor = .blue
        
        stackView = UIStackView(arrangedSubviews: [view1, view2, view3])  //这三个视图对象将被添加到UIStackView容器内
        stackView.frame = CGRect(x: 20, y: 70, width: 320, height: 400)
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal  //在水平方向上排列子视图
        stackView.alignment = UIStackView.Alignment.fill  //通过调整子视图的尺寸在axis设定的方向上填充stackView容器的可用空间
        stackView.distribution = UIStackView.Distribution.fillEqually  //约束子视图具有相同的尺寸，从而使子视图沿着axis方向上填充stackView容器的可用空间
        
        stackView.spacing = 10
        stackView.backgroundColor = .lightGray
        self.view.addSubview(stackView)
        
        let spaccing = UIButton(type: UIButton.ButtonType.roundedRect)
        spaccing.frame = CGRect(x: 20, y: 500, width: 280, height: 30)
        spaccing.setTitle("增加间距", for: .normal)
        spaccing.addTarget(self, action: #selector(setCustomSpacing(_ :)), for: .touchUpInside)
        self.view.addSubview(spaccing)
        
        let insert = UIButton(type: UIButton.ButtonType.roundedRect)
        insert.frame = CGRect(x: 20, y: 540, width: 280, height: 30)
        insert.setTitle("插入视图", for: .normal)
        insert.addTarget(self, action: #selector(insertArrangedSubview(_ :)), for: .touchUpInside)
        self.view.addSubview(insert)
        
        let remove = UIButton(type: UIButton.ButtonType.roundedRect)
        remove.frame = CGRect(x: 20, y: 580, width: 280, height: 30)
        remove.setTitle("删除视图", for: .normal)
        remove.addTarget(self, action: #selector(removeArrangedSubview(_ :)), for: .touchUpInside)
        self.view.addSubview(remove)
        
    }
    
    //当点击第一个按钮时，调整第二个子视图和第三个子视图的间距
    @objc func setCustomSpacing(_ button: UIButton) {
        
        let view = stackView.arrangedSubviews[1]
        stackView.setCustomSpacing(30, after: view)
    }
    
    //当点击第二个按钮时，在第二个子视图的右侧添加一个新的视图对象
    @objc func insertArrangedSubview(_ button: UIButton) {
        
        let view = UIView()
        view.backgroundColor = .green
        stackView.insertArrangedSubview(view, at: 2)
    }
    
    //当点击第三个按钮时，删除第二个子视图
    @objc func removeArrangedSubview(_ button: UIButton) {
        
        let view = stackView.arrangedSubviews[1]
        stackView.removeArrangedSubview(view)
    }
    
}

