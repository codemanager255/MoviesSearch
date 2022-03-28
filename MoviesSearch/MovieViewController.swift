//
//  MovieViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit
protocol MovieViewControllerType: AnyObject{
    func refreshTableView()
}
class MovieViewController: UIViewController, MovieViewControllerType {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: MovieViewControllerType?
    let movieViewModelType: MovieViewModelType = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        movieTableView.dataSource = self
    }
}

extension MovieViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let textEntered = searchBar.text ?? ""
        searchBar.resignFirstResponder()
        searchBar.text = ""
        movieViewModelType.informNetworkManagerToPerformRequest(textEntered: textEntered, caller: self )
    }
}


extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieViewModelType.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = movieTableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell

        cell.movieTitleLbl.text = movieViewModelType.dataReceivedFromAPI?.results[indexPath.row].title ?? "Unavailable"
        cell.movieYearLbl.text = movieViewModelType.dataReceivedFromAPI?.results[indexPath.row].releaseDate ?? "Unavailable"
        cell.movieRatingLbl.text = "\( movieViewModelType.dataReceivedFromAPI?.results[indexPath.row].rating ?? 0.0)"
        cell.movieOverviewLbl.text = movieViewModelType.dataReceivedFromAPI?.results[indexPath.row].overview  ?? "Unavailable"
        let imageUrl = "https://image.tmdb.org/t/p/original\(movieViewModelType.dataReceivedFromAPI?.results[indexPath.row].posterPath ?? "")"
        cell.movieImage.load(urlString: imageUrl)
        movieTableView.rowHeight = UITableView.automaticDimension
        
        return cell
    }
    
}

extension MovieViewController {
    
    func refreshTableView(){
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
}
