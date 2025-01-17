//
//  NYTimesMostPopularUITests.swift
//  NYTimesMostPopularUITests
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import XCTest

class NYTimesMostPopularUITests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }

    func testOpenArticleDetails() {
        let app = XCUIApplication()
        app.launch()

        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["By Shawn Hubler"]/*[[".cells.staticTexts[\"By Shawn Hubler\"]",".staticTexts[\"By Shawn Hubler\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    }
    
    func testOpenFullArticle() {
        
        let app = XCUIApplication()
        app.launch()

        app.tables/*@START_MENU_TOKEN@*/.staticTexts["University of California Will End Use of SAT and ACT in Admissions"]/*[[".cells.staticTexts[\"University of California Will End Use of SAT and ACT in Admissions\"]",".staticTexts[\"University of California Will End Use of SAT and ACT in Admissions\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Read Full Article"].tap()
                
                
    }
}
