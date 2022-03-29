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
    
   
    var viewModel: LoginViewModel!
 
    
    var firebasemocknetwork = FirebaseMockNetworkManager()
    override func setUpWithError() throws {
        
        viewModel = LoginViewModel(firebaseNetworkManager: firebasemocknetwork)
        
    }

    override func tearDownWithError() throws {
        
    }
    
    
    func testLoginValidationSuccess() {
            // GIVEN
            let userEmail = "venkat@test.com"
            let password = "123456"
        
        viewModel.validateFields(userEmail: userEmail, password: password) { isLoginResponce in
            XCTAssertTrue(isLoginResponce)
        }
}
    
    func testLoginValidationFailure() {
            // GIVEN
            let userEmail = "venkatrr@test.com"
            let password = "123456"
        
        viewModel.validateFields(userEmail: userEmail, password: password) { isLoginResponce in
            XCTAssertFalse(isLoginResponce)
        }
}
}
