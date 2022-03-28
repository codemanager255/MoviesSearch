//
//  LoginViewModel.swift
//  MoviesSearch
//
//  Created by admin on 25/03/2022.
//

import Foundation
import Firebase

//protocol LoginViewModelType {
//  //  func validateFields()
//
//}


class LoginViewModel {
    
   var responce: String = ""
//
//    func validateLogin(userName: String, password: String) -> Bool {
//        if userName == "venkat@test.com" && password == "123456" {
//            return true
//        }else {
//            return false
//        }
//    }
    
    
    


    func validateFields(userName: String, password: String, completionHandler:@escaping(_ responce: String)->Void) {

    Auth.auth().signIn(withEmail: userName , password: password) { [weak self] authResult, err in
        guard let strongSelf = self else {return}

        if let err = err {
        print(err.localizedDescription)
            strongSelf.responce = "fail"
            completionHandler(strongSelf.responce)
         }

    if Auth.auth().currentUser != nil {
        print(Auth.auth().currentUser?.uid)
        print("User validated from firebase")
        strongSelf.responce = "success"
        completionHandler(strongSelf.responce)


  }

}
}
}
