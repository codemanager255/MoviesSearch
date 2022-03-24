//
//  LoginViewModel.swift
//  MoviesSearch
//
//  Created by Admin on 24/03/2022.
//

import Foundation

class LoginViewModel {
    
    func validateLogin(userName: String, password: String) -> Bool {
        if userName == "venkat@test.com" && password == "123456" {
            return true
        }else {
            return false
        }
    }
    
    
    
}
