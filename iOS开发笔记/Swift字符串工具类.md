```swift
import Foundation
import QorumLogs
import SwiftDate

class StringUtils: NSObject {
  
    //获取字符串的前N个字符
    class func getPrefixNStr(currentStr: String,length: Int) -> String {
        var strResult = ""
        if currentStr == "" || currentStr.count < length {
            strResult = currentStr
        } else {
          strResult = String(currentStr.prefix(length))
        }
        return strResult
    }
    
    //获取字符串的后N个字符
    class func getSuffixNStr(currentStr: String,length: Int) -> String {
        var strResult = ""
        if currentStr == "" || currentStr.count < length {
            strResult = currentStr
        } else {
            strResult = String(currentStr.suffix(length))
        }
        return strResult
    }
    
    //截取字符串：按开始位、结束位截取
    class func getIndexStr(currentStr: String,start: Int,end: Int) -> String {
        var str = ""
        if currentStr == "" || currentStr.count < end {
            str = currentStr
        }else{
            let startStr = currentStr.index(currentStr.startIndex, offsetBy: start)
            let endStr = currentStr.index(currentStr.startIndex, offsetBy: end)
            str = String(currentStr[startStr..<endStr])
        }
        return str
    }
    
    //获取指定高度字符串宽度
    class func getStrWidth(str: String,fontSize: CGFloat,height: CGFloat = ConstantsHelp.SCREENHEIGHT) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: str).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.width
    }
  
    //获取指定宽度字符串高度
    class func getStrHeight(str: String,fontSize: CGFloat,width: CGFloat = (ConstantsHelp.SCREENWITH - 20)) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: str).boundingRect(with:CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.height
    }
  
    //获取最后一个指定符号后面的信息
    class func getSignBackStr(str: String,sign: String = "\\") -> String {
        var result = ""
        if str == "" || !str.contains(sign) {
            result = str
        } else {
            let list = str.components(separatedBy: sign)
            result = String(list[list.count-1])
        }
        return result
    }
    
    //获取第一个指定符号前面的信息
    class func getSignFrontStr(str: String,sign: String = "(") -> String {
        var result = ""
        if str == "" || !str.contains(sign) {
            result = str
        } else {
            let list = str.components(separatedBy: sign)
            result = String(list[0])
        }
        return result
    }
    
    //保留小数点后n位小数
    class func decimalHold(_ Str: String,_ number: Int,_ isForce: Bool) -> String {
        var tempStr = ""
        if !isForce {
            if Str.contains(".") {
                if Str.split(separator: ".")[1].count >= number {
                    tempStr = Str.split(separator: ".")[0] + "." + getPrefixNStr(currentStr: String(Str.split(separator: ".")[1]), length: number)
                } else {
                    tempStr = Str
                }
            } else {
                tempStr = Str
            }
        } else {
            if Str.contains(".") {
                if Str.split(separator: ".")[1].count >= number {
                    tempStr = Str.split(separator: ".")[0] + "." + getPrefixNStr(currentStr: String(Str.split(separator: ".")[1]), length: number)
                } else {
                    let num = number - Str.split(separator: ".")[1].count
                    tempStr = Str
                    for _ in 1...num {
                      tempStr = tempStr + "0"
                    }
                }
            } else {
                tempStr = Str + "."
                for _ in 1...number {
                    tempStr = tempStr + "0"
                }
            }
        }
        return tempStr
    }
    
    //字符串进行md5摘要加密
    class func md5(_ strs: String) ->String {
        let str = strs.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(strs.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count: 1)
        return String(format: hash as String)
    }
    
    //字符串转字典
    class func toDictionary(_ str: String) -> NSDictionary {
        let jsonData: Data = str.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
  
}

extension String {
    //字符串转换为时间
    //Returns: 时间
    var date: Date? {
        return self.replacingOccurrences(of: "T", with: " ").toDate()?.date
    }
}

extension String {
  
    //字符串转CGFloat
    func toCGFloat() -> CGFloat {
        var float: CGFloat = 0
        if VerifyHelp.isPurnFloat(string: self) {
            let double = Double(self)
            if double != nil {
              float = CGFloat(double!)
            }
        }
        return float
    }
    
    //字符串转为html
    func toNSAttributedString() -> NSAttributedString {
        var result: NSAttributedString = NSAttributedString.init(string: "")
        do {
            result = try NSAttributedString(data: self.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch let error as NSError {
            QL1(error)
            result = NSAttributedString.init(string: "")
        }
        return result
    }
    
    //设置字体颜色以及大小，变为富文本
    func setFontAndColor(color: String = "#000000",fontSize: CGFloat = 17,needBold: Bool = false) -> NSMutableAttributedString {
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: self)  //所有文字变为富文本
        let theRange = NSString(string: self).range(of: self)  //颜色处理的范围
        //颜色处理
        if color == "#000000" {
            if #available(iOS 11.0, *) {
                attrString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor(named: "blackWhiteColor") as Any ,range: theRange)
            } else {
                attrString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.colorWithHexString(hex: color) ,range: theRange)
            }
        } else {
            attrString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.colorWithHexString(hex: color) ,range: theRange)
        }
        if needBold {
            attrString.addAttribute(NSAttributedString.Key.font, value:UIFont.boldSystemFont(ofSize: fontSize), range: theRange)  //字体大小处理
        } else {
            attrString.addAttribute(NSAttributedString.Key.font, value:UIFont.systemFont(ofSize: fontSize), range: theRange)  //字体大小处理
        }
        return attrString
    }
    
    //正则表达式替换字符串
    mutating func raplaceRegex(pattern: String, replaceWith: String = "") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch {
            return
        }
    }
  
    //字符串加倍
    func multipleSplicing(multiple: Int) -> String {
        var result = ""
        if !self.isEmpty {
            for _ in 1...multiple {
              result = result + self
            }
        }
        return result
    }
    
    //字符串判空
    public var isContentEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    //字符串格式化指定日期字符串
    func getFormatDate(type: DateFormateType) -> String {
        var result = ""
        if self != "" {
            result = self.replacingOccurrences(of: "T", with: " ")
            if let tempResult =  DateUtils.dateStringToDate(dateStr: result,type: .YMDHMS) {
                result = tempResult.formatDate(format: type)
            } else {
                result = ""
            }
        }
        return result
    }
    
    //打开url
    func openAsUrl(backAlert: @escaping ()->Void) {
        let url = NSURL(string: self)
        if let resultUrl = url,UIApplication.shared.canOpenURL(resultUrl as URL) {
            DispatchQueue.main.async {
                UIApplication.shared.open(resultUrl as URL, options: [:], completionHandler: nil)
            }
        } else {
            backAlert()
        }
    }

    var notNullStr: NSMutableAttributedString {
        let strg = "*" + self  //全部文字
        let ranStr = "*"  //需变色文字
        let attrstring: NSMutableAttributedString = NSMutableAttributedString(string: strg)  //所有文字变为富文本
        let theRange = NSString(string: strg).range(of: ranStr)  //颜色处理的范围
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.red, range: theRange)  //颜色处理
        return attrstring
    }

}

//富文本问题处理
extension String {
    func attributedString() -> NSMutableAttributedString? {
        let value = self + "<br>"
        guard let data = value.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
        let options: [NSMutableAttributedString.DocumentReadingOptionKey : Any] = [
            NSMutableAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSMutableAttributedString.DocumentReadingOptionKey.documentType : NSMutableAttributedString.DocumentType.html
        ]
        var htmlString = NSMutableAttributedString.init(string: "")
        do {
            htmlString = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        } catch let error as NSError {
            QL1(" \(error.domain) ")
            return NSMutableAttributedString.init(string: error.localizedFailureReason ?? "")
        }
        //适配table不显示问题
        if htmlString.length > 0 {
            htmlString.addAttribute(NSMutableAttributedString.Key.backgroundColor, value: UIColor.clear, range: NSMakeRange(0, 1))
        }
//        QL1("htmlString = \(htmlString)")
        return htmlString  //?.attributedStringWithResizedImages(with: ConstantsHelp.SCREENWITH)
    }
}

//数字转大写
extension Double {
    func numberRMM() -> String {
        return String(self).numberRMM()
    }
}

extension String {
    //人名币大写
    func numberRMM() -> String {
        guard let num = Double(self) else {
            return ""
        }
        let format = NumberFormatter()
        format.locale = Locale(identifier: "zh_CN")
        format.numberStyle = .spellOut
        format.minimumIntegerDigits = 1
        format.minimumFractionDigits = 0
        format.maximumFractionDigits = 2
        let text = format.string(from: NSNumber(value: num)) ?? ""
        let sept = self.components(separatedBy: ".")
        let decimals: Double? = sept.count == 2 ? Double("0." + sept.last!) : nil
        return self.formatRMM(text: text, isInt: decimals == nil || decimals! < 0.01)
    }
    
    private func formatRMM(text: String, isInt: Bool) -> String {
        let formattedString = text.replacingOccurrences(of: "一", with: "壹")
            .replacingOccurrences(of: "二", with: "贰")
            .replacingOccurrences(of: "三", with: "叁")
            .replacingOccurrences(of: "四", with: "肆")
            .replacingOccurrences(of: "五", with: "伍")
            .replacingOccurrences(of: "六", with: "陆")
            .replacingOccurrences(of: "七", with: "柒")
            .replacingOccurrences(of: "八", with: "捌")
            .replacingOccurrences(of: "九", with: "玖")
            .replacingOccurrences(of: "十", with: "拾")
            .replacingOccurrences(of: "百", with: "佰")
            .replacingOccurrences(of: "千", with: "仟")
            .replacingOccurrences(of: "〇", with: "零")
        let sept = formattedString.components(separatedBy: "点")
        var intStr = sept[0]
        if sept.count > 0 && isInt {
            //整数处理
            return intStr.appending("元整")
        } else {
            //小数处理
            let decStr = sept[1]
            intStr = intStr.appending("元").appending("\(decStr.first!)角")
            if decStr.count > 1 {
                intStr = intStr.appending("\(decStr[decStr.index(decStr.startIndex, offsetBy: 1)])分")
            } else {
                intStr = intStr.appending("零分")
            }
            return intStr
        }
    }
}

extension String {
    var isValidEmail: Bool {
        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return range(of: regex,options: .regularExpression,range: nil,locale: nil) != nil
    }
}

extension String {
    //汉字转拼音，不是特别准确，有多音字的问题，比较耗时
    //Returns: 拼音
    func toPinYin() -> String {
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        return string.replacingOccurrences(of:" ", with: "")
    }
}

extension String {
    func subString(from: Int) -> String {
        if from >= self.count {
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.endIndex
        return String(self[startIndex..<endIndex])
    }
}
```

