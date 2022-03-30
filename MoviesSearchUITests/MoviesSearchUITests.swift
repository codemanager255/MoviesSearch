//
//  MoviesSearchUITests.swift
//  MoviesSearchUITests
//
//  Created by MAC on 21/03/22.
//

import XCTest

class MoviesSearchUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    


//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
    
    func testLogin_NotNil(){
           
           let app = XCUIApplication()
           app.launch()
                   
           
           let emailAddress = app.textFields["Enter your email address"]
           XCTAssertNotNil(emailAddress)
           
           let password = app.textFields["Enter your Password"]
           XCTAssertNotNil(password)
           
           XCUIApplication().staticTexts["Login"].tap()
         
           
           
       }
       
       func testLogin_Success(){
           
           let app = XCUIApplication()
           app.launch()
                   
           
           let emailAddress = app.textFields["Enter your email address"]
           emailAddress.tap()
           emailAddress.typeText("venkat@test.com")
           
           let password = app.textFields["Enter your Password"]
           password.tap()
           password.typeText("123456")
           
           XCUIApplication().staticTexts["Login"].tap()
         
           let elementsQuery = app.alerts["Alert!"].scrollViews.otherElements
           let errorMessage = elementsQuery.staticTexts["Login Success"].label
           
           XCTAssertEqual(errorMessage, "Login Success")
           
       }
       
       
       func testLogin_Failure(){
           
           let app = XCUIApplication()
           app.launch()
                   
           
           let emailAddress = app.textFields["Enter your email address"]
           emailAddress.tap()
           emailAddress.typeText("venksfdsfat@test.com")
           
           let password = app.textFields["Enter your Password"]
           password.tap()
           password.typeText("123456789")
           
           XCUIApplication().staticTexts["Login"].tap()
         
           
           let elementsQuery = app.alerts["Alert!"].scrollViews.otherElements
           let errorMessage = elementsQuery.staticTexts["Login Failure"].label
           
           XCTAssertEqual(errorMessage, "Login Failure")
           
       }
       
       
   }
        
    



    
   
