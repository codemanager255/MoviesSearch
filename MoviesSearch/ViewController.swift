//
//  ViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    var loginViewModel = LoginViewModel(firebaseNetworkManager: FirebaseNetworkManager())
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func loginButton(_ sender: Any) {
        var message: String = ""
        loginViewModel.validateFields(userEmail: emailAddressTextField.text, password: passwordTextField.text, completionHandler: { loginResponce in
            if loginResponce == true{
                message = "User successfully login"
            }else{
                message = "Login failure "
            }
            Utility.shared.showAlert(self, "Alert!",message)
        })
        

    
    

}




}

