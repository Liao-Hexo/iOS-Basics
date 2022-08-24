//
//  UnitTestProject_DemoTests.swift
//  UnitTestProject_DemoTests
//
//  Created by 廖家龙 on 2022/8/11.
//

import XCTest
@testable import UnitTestProject_Demo

class UnitTestProject_DemoTests: XCTestCase {

    //setUpWithError方法是在testExample方法运行前被调用的，可以在此方法中进行一些初始化之类的预操作
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("正在调用setUpWithError方法")
    }

    //tearDownWithError方法在testExample方法运行完成后被调用，可以在此方法中做一些清理操作，比如关闭网络请求的连接等
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("正在调用tearDownWithError方法")
    }

    //testExample方法是一个测试示例，可以在该方法中编写测试代码
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let peopleID = "3502111982031500121"
        let count = peopleID.count
        XCTAssert(count == 15 || count == 18, "错误的身份证号码")  //如果判断失败，就输出"错误的身份证号码"日志
        //XCTAssert方法是一种断言，它的格式为XCTAssert(expression,format...)，当expression的值为true时可以通过测试，否则会报错
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
