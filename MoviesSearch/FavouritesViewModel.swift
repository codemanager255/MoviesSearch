//
//  FavouritesViewModel.swift
//  MoviesSearch
//
//  Created by Mateus Goncalves De Ouro on 28/03/2022.
//

import Foundation


class FavouritesViewModel  {
    
    var movies: [Movie] = []

    let favRepo:FavMovieRepositoryType
    
    init(favRepo:FavMovieRepositoryType) {
        self.favRepo = favRepo
    }
    
    func getFavMovies() {
        self.movies =  favRepo.getMovies()
    }
    
    func removeMovie(id : Int64){
        FavMovies.removeMovieEntity(id: id)

        //favRepo.markMoviesAs(movie:Moviee)
    }

   
}
