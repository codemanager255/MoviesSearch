//
//  FavouritesViewModel.swift
//  MoviesSearch
//
//  Created by Mateus Goncalves De Ouro on 28/03/2022.
//

import Foundation


class FavouritesViewModel  {
    

//    var  favMovies: FavMovies = FavMovies()
   
    func removeMovie(id : Int64){
        FavMovies.removeEntity(id: id)
    }
    
    func getEntities() -> [FavMovies] {
        FavMovies.getEntitys(moc: CoreDataManager.shared.persistentContainer.viewContext)
    }
    
}
