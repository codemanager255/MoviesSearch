//
//  FavouriteViewController.swift
//  MoviesSearch
//
//  Created by Admin on 23/03/2022.
//

import Foundation
import UIKit



class FavouriteViewController: UIViewController{
    
    
    
    var favouriteViewModel : FavouritesViewModel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        favouriteViewModel = FavouritesViewModel(favRepo: FavMovieRepository())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favouriteViewModel.getFavMovies()
        tableView.reloadData()
    }

    
    }
    
    
    
    


extension FavouriteViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavouritesCell
        let movie = favouriteViewModel.movies[indexPath.row]
        cell.unFavButton.tag = indexPath.row
        cell.titleLbl.text = movie.title
        cell.descLbl.text = movie.movieDescription
        cell.releaseDateLbl.text = movie.releaseDate
        let path = movie.imagePath
        let imageReturnedURL = "https://image.tmdb.org/t/p/w300/\(path)?api_key=3215a185b25eb297a66e63d137fb994f"
//        cell.favImg.downloadImg(owner: imageReturnedURL)
        return cell
    }
}

extension FavouriteViewController : favouritesCellDelegate {
    func unfavBtn(_ sender: Any) {
        
//        favouriteViewModel.removeMovie(id: Movie[selectedIndex].id)
    }
    
    
    
}
