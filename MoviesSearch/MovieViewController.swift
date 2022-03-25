//
//  MovieViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    var movieList: [MovieData] = []
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        populateMovieArray()
        
        movieTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func populateMovieArray () {
        let m1 = MovieData(title: "Star Wars", date: "1977-05-25", overview: "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.", rating: "8.2")
        let m2 = MovieData(title: "Star Trek Beyond", date: "2016-07-07", overview: "The USS Enterprise crew explores the furthest reaches of uncharted space, where they encounter a mysterious new enemy who puts them and everything the Federation stands for to the test.popularity", rating: "6.8")
        
        movieList = [m1, m2]
    }
    

}

extension MovieViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let textEntered = searchBar.text ?? "no text"
        print("you searched for \(textEntered)")
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
}


extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = movieTableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell
        
        cell.movieTitleLbl.text = movieList[indexPath.row].title
        cell.movieYearLbl.text = movieList[indexPath.row].date
        cell.movieRatingLbl.text = movieList[indexPath.row].rating
        cell.movieOverviewLbl.text = movieList[indexPath.row].overview
        
        
        cell.movieImage.load(urlString: "https://image.tmdb.org/t/p/w300/lV5OpzAss1z06YNagOVap1I35mH.jpg?api_key=3215a185b25eb297a66e63d137fb994f")
        
        
        
        return cell
    }
    
    
}

