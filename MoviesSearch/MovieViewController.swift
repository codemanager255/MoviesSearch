//
//  MovieViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = movieTableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell
        
        cell.movieTitleLbl.text = "baby"
        cell.movieYearLbl.text = "2020"
        cell.movieRatingLbl.text = "5"
        
        
        return cell
    }
    
    
}

