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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let email = emailAddressTextField.text
        let password = passwordTextField.text
        
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
        // print(err.localizedDescription)
           print("Please enter your credentials")
            
                 }
       if Auth.auth().currentUser != nil {
           print(Auth.auth().currentUser?.uid)
           print("Login Validation Completed Using Firebase")
     }
  }

}

}

