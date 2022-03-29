//
//  MovieSearchUtility.swift
//  MoviesSearch
//
//  Created by admin on 25/03/2022.
//

import Foundation
import UIKit

class Utility {
    
    static let shared = Utility()
    private init() {}
    
    func showAlert( ViewController:UIViewController,  title:String, _ message:String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        ViewController.present(alertVC, animated: true, completion: nil)
    }
}
