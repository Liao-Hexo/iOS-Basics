```swift
import SnapKit

let rightButtonItem = UIBarButtonItem(image: UIImage(named: "contact_question_prompt")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(showTip))
self.navigationItem.rightBarButtonItem = rightButtonItem

@objc func showTip() {
    let textView = UITextView()
    textView.text = "提示：办公类的需求，请走行政的物品领用申请。\n①固定资产类：所有权归属于企业的，为生产产品、提供服务、出租或经营管理而持有的，使用时间超过12个月的、未税采购金额大于2000元、能达到可独立使用状态的一类有形资产。\n特点：需要建立资产卡片，后续财务需要进行固定资产摊销。\n例如：电子设备、运输设备、机器设备等。\n②费用服务类：用于没有具体物理形态的采购申请。\n特点：无实物。\n例如：安装服务、维修服务、咨询服务、培训服务、软件服务等。\n③软件系统类：用于独立使用的IT系统及软件采购申请。\n特点：外购系统用于公司自用，财务需要做无形资产摊销。\n例如：PLM系统、WMS系统、SRM系统等。\n④模具类：用于申请开模、改模、备份模开模申请。\n特点：需要付费的开模申请。\n例如：定制某个器件，需要供应商开模，公司需要单独支付费用。\n⑤市场外购类：用于公司采购后通过渠道再销售给客户的采购申请。\n特点：采购后再销售。\n例如：市场中标后购买其他厂家模块等。\n⑥其它类：用于以上申请单范围未包含的采购申请。\n特点：走线下纸质申请但又不在上述五种申请单范围内。"
    textView.textAlignment = .left
    textView.font = .systemFont(ofSize: 14)
    textView.isEditable = false
    textView.backgroundColor = .clear
        
    let alertController = UIAlertController(title:"单据类型说明",message: "", preferredStyle: .alert)
    alertController.view.addSubview(textView)
    textView.snp.makeConstraints { (make) in
        make.left.equalToSuperview().offset(5)
        make.right.equalToSuperview().offset(-5)
        make.top.equalToSuperview().offset(40)
        make.bottom.equalToSuperview().offset(-40)
    }
        
    // 添加约束
    var height: NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 450)
    alertController.view.addConstraint(height)
        
    let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
    alertController.addAction(cancelAction)
    present(alertController, animated: true, completion: nil)
}
```



