//
//  ViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit
import FirebaseAuth



class ViewController: UIViewController {
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let loginViewModel = LoginViewModel()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    
    @IBAction func loginButton(_ sender: Any) {
        
        if let message = loginViewModel.validateFields(userEmail: emailAddressTextField.text, password: passwordTextField.text){
            Utility.shared.showAlert(self, "Alert!", message)
        }
        

    
    

}




}

