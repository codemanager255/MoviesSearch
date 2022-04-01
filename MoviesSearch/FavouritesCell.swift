//
//  FavouritesCell.swift
//  MoviesSearch
//
//  Created by Admin on 23/03/2022.
//

import Foundation
import UIKit

protocol favouritesCellDelegate  {
    
    func unfavBtn(_ sender : Any )
}

class FavouritesCell: UITableViewCell, favouritesCellDelegate {
    
    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!

    @IBOutlet weak var unFavButton: UIButton!
    
    @IBAction func unfavBtn(_ sender: Any) {
            
            let selectedIndex = unFavButton.tag
            
            
        }
}
