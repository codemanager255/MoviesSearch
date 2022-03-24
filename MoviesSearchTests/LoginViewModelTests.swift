//
//  LoginViewModelTests.swift
//  MoviesSearchTests
//
//  Created by Admin on 24/03/2022.
//

import XCTest
//1. Import the target
@testable import MoviesSearch

class LoginViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testValidateLogin_success() {
        
        //Given
        //Create object of LoginViewModel
        let loginViewModel = LoginViewModel()
        
        let userName = "venkat@test.com"
        let password = "123456"
        //When
      let actualOutput =
        loginViewModel.validateLogin(userName: userName, password: password)
        //Then
        let expectedOutput = true
        
        //assert Statements
        XCTAssertEqual(actualOutput, expectedOutput)
        
    }
    
    func testValidateLogin_failure(){
        
        //Given
        let loginViewModel = LoginViewModel()
        
        let userName = "Venkat"
        let password = "123"
        
        //When
        let actualOutput =
        loginViewModel.validateLogin(userName: userName, password: password)
        
        //Then
        let expectedOutput = false
        
        //assert Statements
        XCTAssertEqual(actualOutput, expectedOutput)
        
    }
}
