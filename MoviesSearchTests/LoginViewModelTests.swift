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
    
   // var mockNetwork: FirebaseMockNetworkManager!
   //      var viewModel: LoginViewModel!
 
    
    var firebasemocknetwork = FirebaseMockNetworkManager()
    override func setUpWithError() throws {
        
     //   viewModel.networkManger = mockNetwork
        
    }

    override func tearDownWithError() throws {
        
    }
    
    
    
    func testLoginValidationSuccess() {
            // GIVEN
             let userEmail = "venkat@test.com"
            let password = "123456"
            let jsonName = "FirebaseSuccess"
        
            // When
        firebasemocknetwork.validateFields(userEmail: userEmail, password: password, fileName: jsonName)
         
        //AssertStatements
        let actualOutput = firebasemocknetwork.dataResponce
    
            // Then
        let expectedOutput = "Success"
         XCTAssertEqual(actualOutput, expectedOutput)

        }
    
    func testLoginValidationFailure() {
            // GIVEN
             let userEmail = "venkat@test.com"
            let password = "123456"
            let jsonName = "FirebaseFailure"
            // When
        firebasemocknetwork.validateFields(userEmail: userEmail, password: password, fileName: jsonName)
         
        //AssertStatements
        let actualOutput = firebasemocknetwork.dataResponce
    
            // Then
        let expectedOutput = "failure"
         XCTAssertEqual(actualOutput, expectedOutput)

        }

//    func testValidateLogin_success() {
//
//        //Given
//        //Create object of LoginViewModel
//        let loginViewModel = LoginViewModel()
//
//        let userName = "venkat@test.com"
//        let password = "123456"
//        //When
////      let actualOutput =
////        loginViewModel.validateLogin(userName: userName, password: password)
//        //Then
//        let expectedOutput = true
//
//        //assert Statements
//      //  XCTAssertEqual(actualOutput, expectedOutput)
//
//    }
    
    func testValidateLogin_failure(){
        
        //Given
        let loginViewModel = LoginViewModel()
        
        let userName = "Venkat"
        let password = "123"
        
        //When
        //let actualOutput =
//        loginViewModel.validateLogin(userName: userName, password: password)
        
        //Then
        let expectedOutput = false
        
        //assert Statements
     //  XCTAssertEqual(actualOutput, expectedOutput)
        
    }
}
