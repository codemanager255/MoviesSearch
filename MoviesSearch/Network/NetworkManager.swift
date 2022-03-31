//
//  NetworkManager.swift
//  MoviesSearch
//
//  Created by Awani Melvyn on 28/03/2022.
//

import Foundation

protocol Networkable{
    func performRequest(baseUrl: String, path: String, params: [String: String], completionHandler:@escaping(Result<MovieData, Error>) -> Void)
}

class NetworkManager: Networkable{
        
    func performRequest(baseUrl: String, path: String, params: [String: String], completionHandler:@escaping(Result<MovieData, Error>) -> Void){
        
        var urlComponents = URLComponents(string: baseUrl.appending(path))
        
        let queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        urlComponents?.queryItems = queryItems
        
        
        
        guard let url = urlComponents?.url
        else{
            return
        }
        let urlSession = URLSession.shared
        
        
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
