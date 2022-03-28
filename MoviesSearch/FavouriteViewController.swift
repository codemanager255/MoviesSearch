//
//  FavouriteViewController.swift
//  MoviesSearch
//
//  Created by Admin on 23/03/2022.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController {
    
    var favouriteViewModel : FavouritesViewModel!
    
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [FavMovies] = []
    var cellId: Int64 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movies = favouriteViewModel.getEntities()
        tableView.reloadData()
    }
    
    @IBAction func unfavBtn(_ sender: Any) {
        favouriteViewModel.removeMovie(id: cellId)
        tableView.reloadData()
    }
    
}

extension FavouriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavouritesCell
        cellId = movies[indexPath.row].id
        cell.titleLbl.text = movies[indexPath.row].title
        cell.descLbl.text = movies[indexPath.row].description
        cell.releaseDateLbl.text = movies[indexPath.row].releaseDate
        let path = movies[indexPath.row].imagePath
        let imageReturnedURL = "https://image.tmdb.org/t/p/w300/\(path)?api_key=3215a185b25eb297a66e63d137fb994f"
//        cell.favImg.downloadImg(owner: imageReturnedURL)
        return cell
    }
}
