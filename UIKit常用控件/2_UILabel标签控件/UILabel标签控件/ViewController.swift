//
//  ViewController.swift
//  UILabel标签控件
//
//  Created by 廖家龙 on 2021/7/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
/*
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 80))
        label.text = "Hello,Xcode and Swift!"
        label.font = UIFont(name: "Arial", size: 24)  //设置文字的字体和尺寸
        
        label.textAlignment = NSTextAlignment.right  //设置文字的对齐方式为右对齐
        label.textColor = UIColor.purple
        label.backgroundColor = UIColor.yellow
        
        label.shadowColor = UIColor.lightGray  //给标签中的文字添加了一个投影效果，阴影的颜色为浅灰色
        label.shadowOffset = CGSize(width: 2, height: 2)  //阴影的偏移距离为2
        
        self.view.addSubview(label)
 */
        
/*
        //UILabel在默认状态下只显示一行文字内容
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 300, height: 150))
        label.text = "Love you、think of you.love you secretly,love you eagerly,wait,feel disappointed,try hard,lose,and feel sad,go apart,and recall.these are for sake of you.And I will regret for it."
        
        label.backgroundColor = UIColor.yellow
        label.textColor = UIColor.purple
        label.textAlignment = NSTextAlignment.left
        
        label.numberOfLines = 0  //将它设置为一个大于1的值，文本的行数将会被限制为这个指定的值，若设置为0，则UILabel不管文本占多少行都可以显示所有的文字内容
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail  //结尾部分的内容以...方式省略
 
        //换行模式：
        //byWordWrapping：默认状态，当单词本身不适合一行显示时，换行将发生在单词的边界上
        //byCharWrapping：换行发生在到达标签边界的第一个字符之前
        //byClipping：超过文本容器边界的文本行的内容将不会被绘制
        //byTruncatingHead：在行首进行剪切，并以...表示被剪切的文字
        //byTruncatingTail：在行尾进行剪切，并以...表示被剪切的文字
        //byTruncatingMiddle：在行中进行剪切，并以...表示被剪切的文字
        
        self.view.addSubview(label)
*/
        
        //在一个UILabel中使用不同的颜色、不同的字体样式来设置字符串中的不同区域的文字
        let attributedText = NSMutableAttributedString(string: "coolketang.com")
        
        //设置字符串的前4个字符的样式为加粗的48号字体
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 48), range: NSMakeRange(0, 4))
        
        //设置字符串第5～11个字符的字体颜色为紫色
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: NSMakeRange(4, 7))
        
        //设置字符串最后三个字符的背景颜色为橙色
        attributedText.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.orange, range: NSMakeRange(11, 3))
        
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 60))
        label.attributedText = attributedText
        
        self.view.addSubview(label)
    }
    
}


