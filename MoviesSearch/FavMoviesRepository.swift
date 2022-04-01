//
//  FavMoviesRepository.swift
//  MoviesSearch
//
//  Created by Mateus Goncalves De Ouro on 29/03/2022.
//

import Foundation


protocol FavMovieRepositoryType {
    func getMovies() -> [Movie]
    func markMoviesAs(_ isFavourite:Bool)
}

class FavMovieRepository: FavMovieRepositoryType  {
   
    func getMovies() -> [Movie] {
        let favMovies = FavMovies.getMoviesEntitys(moc: CoreDataManager.shared.persistentContainer.viewContext)
        
       return favMovies.map {
           Movie(id:$0.id, imagePath: $0.imagePath ?? "", movieDescription: $0.movieDescription ?? "", releaseDate: $0.releaseDate ?? "", title: $0.title ?? "")
        }
    }
    
    func markMoviesAs(_ isFavourite:Bool) {
        
    }
}
