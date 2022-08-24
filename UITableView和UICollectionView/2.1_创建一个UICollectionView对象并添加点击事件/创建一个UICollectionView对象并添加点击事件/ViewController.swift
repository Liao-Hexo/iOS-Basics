//
//  ViewController.swift
//  创建一个UICollectionView对象并添加点击事件
//
//  Created by 廖家龙 on 2021/7/10.
//

//UITableView最大的特点：将所有的内容都以上下相连的方式排列在一栏滚动列表中，这就使得UITableView的布局有了很大的局限性
//UICollectionView用于展示集合视图，其布局更加灵活，可实现多列布局，可以把UICollectionView理解成多列的UITableView

//此实例中将使用UICollectionView的UICollectionViewFlowLayout默认布局模式，除了该布局模式之外，UICollectionView还具有堆叠布局、圆形布局、Cover Flow布局模式
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //该数组将作为UICollectionView对象的数据源
    var images = ["Pic1", "Pic2", "Pic3", "Pic4", "Pic5", "Pic6", "Pic7", "Pic8", "Pic9", "Pic9", "Pic9", "Pic9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 155, height: 135)  //该属性用来设置cell的默认尺寸信息
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical  //垂直方向，即集合视图可以在垂直方向上进行滑动，网格只能在一个方向轴上进行滑动，要么是垂直方向，要么是水平方向
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 20), collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //由于集合对象是通过代码生成的，而不是通过故事版或NIB文件生成，因此需要注册一个UICollectionViewCell类，不然在初始化新的UICollectionViewCell时会发生错误，同时要注意forCellWithReuseIdentifier:参数的值，该值应与创建UICollectionViewCell对象时的重用标志字符串相同
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reusedCell")
        
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //初始化并复用UICollectionViewCell对象
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "reusedCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        //检查cell中是否存在tag值为1的UIImageView对象，如果不存在就给cell添加一个新的UIImageView对象
        let imageView: UIImageView? = cell.viewWithTag(1) as? UIImageView
        
        if imageView == nil {
            
            let image = UIImage(named: images[(indexPath as NSIndexPath).row])
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 135)
            imageView.layer.opacity = 0.5  //层的透明度
            imageView.tag = 1
            
            cell.addSubview(imageView)
        } else {
            
            imageView?.image = UIImage(named: images[(indexPath as NSIndexPath).row])
        }
        
        return cell
    }
    
    //实现UICollectionViewDelegate协议中的手指触摸检测方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        let imageView = cell?.viewWithTag(1)
        
        imageView?.layer.opacity = 1.0
    }

}
