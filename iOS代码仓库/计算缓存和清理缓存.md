### 计算缓存，用于在画面显示

```swift
let message = caculateCacheSize()
print(message)

func caculateCacheSize() -> String {
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first  //取出cache文件夹路径，print(cachePath)
        let files = FileManager.default.subpaths(atPath: cachePath!)  //取出文件夹下所有文件数组
        var size = Int()  //用于统计文件夹内所有文件大小
        
        for file in files! {
            let path = cachePath!.appending("/\(file)")  //把文件名拼接到路径中
            let floder = try!FileManager.default.attributesOfItem(atPath: path)  //取出文件属性
            
            //用元组取出文件大小属性
            for (abc,bcd) in floder {
                //只取出文件大小进行拼接
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).integerValue
                }
            }
        }
        
        let message = "\(size/(1024*1024))M"  //提示框
        return message
}
```

### 清理缓存

```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    if indexPath.row == 3 {
        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 0))
        
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first  //缓存路径
        let files = FileManager.default.subpaths(atPath: cachePath!)  //取出文件夹下所有文件数组
        
        //提示框
        let message = cell?.detailTextLabel?.text
        let alert = UIAlertController(title: NSLocalizedString("Clear cache", comment: ""), message: message, preferredStyle: UIAlertController.Style.alert)
        let alertConfirm = UIAlertAction(title: NSLocalizedString("Confirm", comment: ""), style: UIAlertAction.Style.default) { (alertConfirm) -> Void in
            //点击确定时开始删除
            for p in files! {
                
                let path = cachePath!.appendingFormat("/\(p)")  //拼接路径
                //判断是否可以删除
                if (FileManager.default.fileExists(atPath: path)) {
                    
                    try!FileManager.default.removeItem(atPath: path)  //删除
                }
            }
          cell!.detailTextLabel?.text = "0M"
        }
        let alertCancle = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertAction.Style.cancel) { (alertCancle) -> Void in }
      
        alert.addAction(alertConfirm)
        alert.addAction(alertCancle)
        self.present(alert, animated: true) { }  //提示框弹出
    }
  
}
```

