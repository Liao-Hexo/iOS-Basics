//
//  EmailTester.swift
//  UnitTestProject_ValidateEmailTests
//
//  Created by 廖家龙 on 2022/8/11.
//

import XCTest
@testable import UnitTestProject_ValidateEmail

//可以在项目起始阶段使用项目自带的单元测试文件进行单元测试工作，但是随着项目的逐渐深入，功能的日渐增多，使用一个单元测试文件时，文件中的测试用例方法就会变得非常拥挤，所以我们经常根据不同的功能模块创建不同的单元测试文件
class EmailTester: XCTestCase {
    
    func testEmail() {
        
        let emailUtil = EmailUtil()
        let result = emailUtil.validateEmail(email: "support@coolketang.")
        XCTAssert(result, "邮箱格式不正确。")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
