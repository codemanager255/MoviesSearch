//
//  MovieViewModel.swift
//  MoviesSearch
//
//  Created by Awani Melvyn on 28/03/2022.
//

import Foundation
protocol MovieViewModelType: AnyObject{
    var dataReceivedFromAPI: MovieData? {get}
    func informNetworkManagerToPerformRequest(textEntered: String)
}

class MovieViewModel: MovieViewModelType{
    var networkManager = NetworkManager()
    var dataReceivedFromAPI: MovieData?
    let url = "https://api.themoviedb.org/3/search/movie?api_key=3215a185b25eb297a66e63d137fb994f&language=en-US&query="
    
    
    
    func informNetworkManagerToPerformRequest(textEntered: String){
        let requestUrl = "\(url)\(textEntered)"
        print("perform request was called from the MovieView Model")
        performRequest(requestUrl: requestUrl)
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
            print("FROM MODEL: \(dataReceivedFromAPI?.results.count)")
            
//            DispatchQueue.main.async {
//                self.movieTableView.reloadData()
//            }
            
        } catch{
            print(error)
        }
    }
}
