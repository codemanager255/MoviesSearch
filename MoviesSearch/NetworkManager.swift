//
//  NetworkManager.swift
//  MoviesSearch
//
//  Created by Awani Melvyn on 28/03/2022.
//

import Foundation

protocol Networkable{
    var delegate: MovieViewControllerType? {get set}
    func performRequest(requestUrl: String)
}

class NetworkManager{
    
    weak var delegate: MovieViewControllerType?
    
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
            let  dataReceivedFromAPI = decodedData
            self.delegate?.dataReceivedFromAPINetwork(safeData: dataReceivedFromAPI)
//            
//            DispatchQueue.main.async {
//    //            self.movieTableView.reloadData()
//            }
            
        } catch{
            print(error)
        }
    }

}
