//
//  MovieCell.swift
//  MoviesSearch
//
//  Created by Admin on 23/03/2022.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var movieRatingLbl: UILabel!
    
    @IBOutlet weak var movieYearLbl: UILabel!
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
