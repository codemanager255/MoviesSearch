//
//  FirebaseMockNetworkManager.swift
//  MoviesSearchTests
//
//  Created by Admin on 28/03/2022.
//

import Foundation
@testable import MoviesSearch


class FirebaseMockNetworkManager: FirebaseNetworkManagerType {
    func validateFields(userEmail: String?, password: String?, completionHandler: @escaping (Bool) -> Void) {
        
        if userEmail == "venkat@test.com" && password == "123456"{
            completionHandler(true)
        }else{
            completionHandler(false)
        }
         }
    }
    
   
    
