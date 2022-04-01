//
//  MockFavMovieRepository.swift
//  MoviesSearchTests
//
//  Created by Mateus Goncalves De Ouro on 30/03/2022.
//

import Foundation
@testable import MoviesSearch


class MockFavMovieRepository: FavMovieRepositoryType {
    
    
    func getMovies() -> [Movie] {
        return [ Movie(id:1, imagePath:"", movieDescription:"", releaseDate:"", title:""), Movie(id:2, imagePath:"", movieDescription:"", releaseDate:"", title:"")]
    }
    
    func markMoviesAs(_ isFavourite: Bool) {
        
    }
    
}
