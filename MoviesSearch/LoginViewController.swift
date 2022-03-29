//
//  ViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginViewModel = LoginViewModel(firebaseNetworkManager: FirebaseNetworkManager())
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func validateDetails() -> String? {
        
        if emailAddressTextField.text == "" {
            passwordTextField.text == ""
            return nil
        }
        return nil


    }
    
    @IBAction func loginButton(_ sender: Any) {
        let email = emailAddressTextField.text
        let password = passwordTextField.text
        validateFields()
  }
    
   func validateFields() {
       Auth.auth().signIn(withEmail: emailAddressTextField.text ?? "", password: passwordTextField.text ?? "") {[weak self] authResult, err in
           guard let strongSelf = self else {return}
        if let err = err {
         //print(err.localizedDescription)
            
            let failureMessage = "Login Failure"
        Utility.shared.showAlert(ViewController: self!, title: "Alert!", failureMessage)
           //print("Please enter your credentials")
            
                 }
       if Auth.auth().currentUser != nil {
           print(Auth.auth().currentUser?.uid)
           
           let successMessage = "Login Success"
           Utility.shared.showAlert(ViewController: self!, title: "Alert!", successMessage)
           //print("Login Validation Completed Using Firebase")
     }
  }

        var message: String = ""
        loginViewModel.validateFields(userEmail: emailAddressTextField.text, password: passwordTextField.text, completionHandler: { loginResponce in
            if loginResponce == true{
                message = "User successfully login"
            }else{
                message = "Login failure "
            }
            Utility.shared.showAlert(ViewController: self, title: "Alert!",message)
        })
        

    
    
}




}

