//
//  NetworkManager.swift
//  MoviesSearch
//
//  Created by Awani Melvyn on 28/03/2022.
//

import Foundation

class NetworkManager{
    
    
    
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
            
       //     dataReceivedFromAPI = decodedData
            
            DispatchQueue.main.async {
    //            self.movieTableView.reloadData()
            }
            
        } catch{
            print(error)
        }
    }

}
