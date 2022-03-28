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
    func dataReceivedFromAPINetwork(safeData: MovieData)
    func getNumberOfItems() -> Int
}

class MovieViewModel: MovieViewModelType{
    var networkManager = NetworkManager()
    var dataReceivedFromAPI: MovieData?
    weak var delegate: MovieViewControllerType?
    
    
    let url = "https://api.themoviedb.org/3/search/movie?api_key=3215a185b25eb297a66e63d137fb994f&language=en-US&query="
    
    
    func informNetworkManagerToPerformRequest(textEntered: String, caller: MovieViewControllerType){
        networkManager.delegate = caller
        let requestUrl = "\(url)\(textEntered)"
        networkManager.performRequest(requestUrl: requestUrl)
        print("perform request was called from the MovieView Model")
    }

    
    func getNumberOfItems() -> Int {
        return dataReceivedFromAPI?.results.count ?? 0
    }
    
    func dataReceivedFromAPINetwork(safeData: MovieData){
        dataReceivedFromAPI = safeData
    }

}
