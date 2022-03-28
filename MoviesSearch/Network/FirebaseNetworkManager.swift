//
//  FirebaseNetworkManager.swift
//  MoviesSearch
//
//  Created by Admin on 28/03/2022.
//

import Foundation
import Firebase

protocol FirebaseNetworkManagerType{
    func validateFields(userEmail: String?, password: String?,completionHandler:@escaping(_ responce: Bool)->Void)
    
}

class FirebaseNetworkManager: FirebaseNetworkManagerType {
    
    func validateFields(userEmail: String?, password: String?,completionHandler:@escaping(_ responce: Bool)->Void) {
        
        
        
        Auth.auth().signIn(withEmail: userEmail ?? "", password: password ?? "") { authResult, error in
            
            if  error != nil {
                completionHandler(false)
            }
            
            if Auth.auth().currentUser != nil {
                completionHandler(true)
                
            }
        }
        
    }
}

