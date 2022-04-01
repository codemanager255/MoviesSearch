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
    
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        var message: String = ""
        loginViewModel.validateFields(userEmail: emailAddressTextField.text, password: passwordTextField.text, completionHandler: { loginResponce in
            if loginResponce == true{
                message = "User successfully login"
                let storyboard = UIStoryboard(name: "MovieSearch", bundle: Bundle.main)
                let vc = storyboard.instantiateViewController(withIdentifier: "MovieViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                message = "Login failure "
            }
            Utility.shared.showAlert(ViewController: self, title: "Alert!",message)
        })
        
        
        
        
    }
    
    
    
}
    

    
    

