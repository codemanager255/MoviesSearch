//
//  MovieViewModel.swift
//  MoviesSearch
//
//  Created by Awani Melvyn on 28/03/2022.
//

import Foundation
protocol MovieViewModelType: AnyObject{
    var dataReceivedFromAPI: MovieData? {get}
    func informNetworkManagerToPerformRequest(textEntered: String, caller: MovieViewControllerType)
//    func dataReceivedFromAPINetwork(safeData: MovieData)
    func getNumberOfItems() -> Int
}

class MovieViewModel: MovieViewModelType{
    var networkManager:Networkable = NetworkManager()
    var dataReceivedFromAPI: MovieData?
    weak var delegate: MovieViewControllerType?
    
    
    
    func informNetworkManagerToPerformRequest(textEntered: String, caller: MovieViewControllerType){
        networkManager.performRequest(baseUrl: EndPoints.baseUrl, path: Path.searchMovie, params: ["api_key":"3215a185b25eb297a66e63d137fb994f", "language": "en-US", "query": textEntered]) {[weak self] result in
            
            switch(result){
            case .success(let movieData):
                self?.dataReceivedFromAPI = movieData
                caller.refreshTableView()
            case .failure(let error):
                print(error)
            }
            
            
        }
            
        
    }

    
    func getNumberOfItems() -> Int {
        return dataReceivedFromAPI?.results.count ?? 0
    }


}
