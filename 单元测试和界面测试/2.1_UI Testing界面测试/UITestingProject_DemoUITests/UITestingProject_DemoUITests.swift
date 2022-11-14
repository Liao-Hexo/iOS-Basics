//
//  UITestingProject_DemoUITests.swift
//  UITestingProject_DemoUITests
//
//  Created by 廖家龙 on 2022/8/11.
//

import XCTest

class UITestingProject_DemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        //当UI测试失败时立即停止UI测试
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //testExample方法和单元测试一样，可以用来执行一个测试用例，和单元测试不同的是，当运行UI测试后，testExample方法用来记录每一步操作，而无需开发者手写代码
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Add"]/*[[".buttons[\"Add\"].staticTexts[\"Add\"]",".staticTexts[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Switch"]/*[[".buttons[\"Switch\"].staticTexts[\"Switch\"]",".staticTexts[\"Switch\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Remove"]/*[[".buttons[\"Remove\"].staticTexts[\"Remove\"]",".staticTexts[\"Remove\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()  //启动进行UI测试的应用程序
            }
        }
    }
}
