//
//  LoginViewModel.swift
//  MoviesSearch
//
//  Created by Admin on 24/03/2022.
//

import Foundation
import Firebase


class LoginViewModel {
    
    var networkManger = FirebaseNetworkManager()
    func validateFields(userEmail: String?, password: String?)-> String? {

        var responce = ""

               Auth.auth().signIn(withEmail: userEmail ?? "", password: password ?? "") { [weak self] authResult, err in
                   guard let strongSelf = self else {return}

                   if let err = err {
                   print(err.localizedDescription)
                       responce = "Login Failure"
                    }

               if Auth.auth().currentUser != nil {
                   print(Auth.auth().currentUser?.uid)
                   responce = "Login Success"

             }
               }
        return responce
    }
    
    


}
