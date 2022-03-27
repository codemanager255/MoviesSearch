//
//  MovieViewController.swift
//  MoviesSearch
//
//  Created by MAC on 21/03/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var dataReceivedFromAPI: MovieData?
    
    let url = "https://api.themoviedb.org/3/search/movie?api_key=3215a185b25eb297a66e63d137fb994f&language=en-US&query="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        movieTableView.dataSource = self
    }
}

extension MovieViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let textEntered = searchBar.text ?? "no text"
        print("you searched for \(textEntered)")
        searchBar.resignFirstResponder()
        searchBar.text = ""
        let requestUrl = "\(url)\(textEntered)"
        performRequest(requestUrl: requestUrl)
        movieTableView.reloadData()
    }
}


extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataReceivedFromAPI?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = movieTableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell

        cell.movieTitleLbl.text = dataReceivedFromAPI?.results[indexPath.row].title ?? "Unavailable"
        cell.movieYearLbl.text = dataReceivedFromAPI?.results[indexPath.row].releaseDate ?? "Unavailable"
        cell.movieRatingLbl.text = "\( dataReceivedFromAPI?.results[indexPath.row].rating ?? 0.0)"
        cell.movieOverviewLbl.text = dataReceivedFromAPI?.results[indexPath.row].overview  ?? "Unavailable"
        let imageUrl = "https://image.tmdb.org/t/p/original\(dataReceivedFromAPI?.results[indexPath.row].posterPath ?? "")"
        cell.movieImage.load(urlString: imageUrl)
        movieTableView.rowHeight = UITableView.automaticDimension
        
        return cell
    }
    
    
    func performRequest(requestUrl: String){
        let urlSession = URLSession.shared
        guard let url = URL(string: requestUrl)
        else{
            return
        }
        
        let dataTask = urlSession.dataTask(with: url){ data, response, error in
            
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data{
                self.parseJSON(movieData: safeData)
            }
        }
        dataTask.resume()
        
    }
    
    func parseJSON(movieData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            dataReceivedFromAPI = decodedData
            
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
            
        } catch{
            print(error)
        }
    }
}

