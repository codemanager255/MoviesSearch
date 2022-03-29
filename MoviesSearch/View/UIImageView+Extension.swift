//
//  UIImageView+Extension.swift
//  MoviesSearch
//
//  Created by Admin on 25/03/2022.
//

import Foundation
import UIKit

// To load image for the movie selection
extension UIImageView {
    func load (urlString: String) {
        guard let url = URL(string: urlString)
        else {
            return
            
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
    
}
