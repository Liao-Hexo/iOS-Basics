//
//  AppDelegate.swift
//  3D_Touch的使用
//
//  Created by 廖家龙 on 2021/7/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let addEventIcon = UIApplicationShortcutIcon(type: .add)  //创建了一个系统自带的类型为UIApplicationShortcutIcon.IconType.add的快捷图标，系统提供了29种快捷图标供开发者使用
        let unlockEventIcon = UIApplicationShortcutIcon(templateImageName: "unlockEvent")  //使用项目资源文件夹中的图片创建了两个自定义的快捷图标
        let listEventIcon = UIApplicationShortcutIcon(templateImageName: "listEvent")
        
        //设置快捷项目的标题、图标等信息
        //type：必要参数，表示快捷项目的唯一标识
        //localizedTitle：必要参数，表示快捷项目的标题
        //localizedSubtitle：可选参数，表示快捷项目的副标题
        //icon：可选参数，表示快捷项目的图标
        //userInfo：可选参数，表示app传递给动作的自定义数据信息
        let addEvent = UIApplicationShortcutItem(type: "com.coolketang.addMember", localizedTitle: "添加会员", localizedSubtitle: "Add Member", icon: addEventIcon, userInfo: nil)
        let unlockEvent = UIApplicationShortcutItem(type: "com.coolketang.unlockMember", localizedTitle: "解锁会员", localizedSubtitle: "Unlock Member", icon: unlockEventIcon, userInfo: nil)
        let listEvent = UIApplicationShortcutItem(type: "com.coolketang.memberList", localizedTitle: "会员列表", localizedSubtitle: "Members List", icon: listEventIcon, userInfo: nil)
        
        let shortCutItems = [addEvent, unlockEvent, listEvent]
        application.shortcutItems = shortCutItems
        
        return true
    }
    
    //响应用户在快捷菜单中的点击事件
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        if shortcutItem.type == "com.coolketang.addMember" {
            print("跳转至添加会员页面。")
            
        } else if shortcutItem.type == "com.coolketang.unlockMember"{
            print("跳转至解锁会员页面。")
            
        } else if shortcutItem.type == "com.coolketang.memberList"{
            print("跳转至会员列表页面。")
        }
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

