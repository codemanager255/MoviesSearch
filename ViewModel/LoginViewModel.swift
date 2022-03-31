//
//  LoginViewModel.swift
//  MoviesSearch
//


//  Created by Admin on 24/03/2022.

//

import Foundation
import Firebase


class LoginViewModel {
    
    
  private let firebaseNetworkManager: FirebaseNetworkManagerType
    
    init(firebaseNetworkManager: FirebaseNetworkManagerType){
        self.firebaseNetworkManager = firebaseNetworkManager
    }

    func validateFields(userEmail: String?, password: String?,completionHandler:@escaping(_ responce: Bool)->Void){
        
        firebaseNetworkManager.validateFields(userEmail: userEmail, password: password) { responce in
            
            completionHandler(responce)
        }
            
       
    }

}

