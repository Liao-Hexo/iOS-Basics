//
//  EmailUtil.swift
//  UnitTestProject_ValidateEmail
//
//  Created by 廖家龙 on 2022/8/11.
//

import Foundation

struct RegexHelper {
    let regex: NSRegularExpression?
    
    //对结构体进行初始化，并传入一个字符串参数，作为正则表达式
    init(_ pattern: String) {
        do {
            //创建一个正则表达式，并且不对大小写进行区分
            regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        } catch {
            regex = nil
        }
    }
    
    func match(_ input: String) -> Bool {
        //比较在字符串中匹配正则表达式的位置是否大于0，以判断字符串与正则表达式是否匹配，如果字符串不匹配正则表达式，就返回否的布尔结果
        if let matches = regex?.matches(in: input, options: .reportProgress, range: NSMakeRange(0, input.lengthOfBytes(using: String.Encoding.utf8))) {
            
            return matches.count > 0
        } else {
            
            return false
        }
    }
}

class EmailUtil {
    
    //使用正则表达式检测邮箱字符串的格式是否正确
    func validateEmail(email: String) -> Bool {
        
        let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher = RegexHelper(pattern)
        
        if matcher.match(email) {
            return true
        }
        
        return false
    }
}
