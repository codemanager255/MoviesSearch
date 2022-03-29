//
//  NetworkManager.swift
//  MoviesSearch
//
//  Created by Awani Melvyn on 28/03/2022.
//

import Foundation

protocol Networkable{
    func performRequest(requestUrl: String, searchMoviePath: String, MovieParams: [String: String], completionHandler:@escaping(Result<MovieData, Error>) -> Void)
}

class NetworkManager: Networkable{
        
    func performRequest(requestUrl: String, searchMoviePath: String, MovieParams: [String: String], completionHandler:@escaping(Result<MovieData, Error>) -> Void){
        
        var movieComponents = URLComponents(string: requestUrl.appending(searchMoviePath))
        
        let movieQueryItems = MovieParams.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        movieComponents?.queryItems = movieQueryItems
        
        
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
                let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(MovieData.self, from: safeData)
                    completionHandler(.success(decodedData))
                    
                } catch{
                    completionHandler(.failure(error))
                    print(error)
                }
            }
        }
        dataTask.resume()
        
    }
    

}
