//
//  FavouriteMovies+Extension.swift
//  MoviesSearch
//
//  Created by Admin on 23/03/2022.
//

import Foundation
import CoreData

extension FavMovies {
    
    static func saveEntity(title: String, movieDescription: String, releaseDate: String, imagePath: String, id: Int, moc: NSManagedObjectContext) {
        let movieEntity = NSEntityDescription.insertNewObject(forEntityName: "FavMovies", into: moc) as! FavMovies
        
        movieEntity.title = title
        movieEntity.movieDescription = movieDescription
        movieEntity.releaseDate = releaseDate
        movieEntity.imagePath = imagePath
        movieEntity.id = Int64(id)
        
        CoreDataManager.shared.saveContext()
    }
    
    static func removeEntity(id: Int64) {
        guard let favMovie = getEntity(id: id, moc: CoreDataManager.shared.persistentContainer.viewContext) else {return}
        CoreDataManager.shared.persistentContainer.viewContext.delete(favMovie)
        CoreDataManager.shared.saveContext()

    }
    
    static func getEntitys(moc: NSManagedObjectContext) -> [FavMovies] {
        let fr = FavMovies.fetchRequest()
        
        do {
            let entity = try moc.fetch(fr)
            return entity
        }catch{
            print(error.localizedDescription)

            return []
        }
    }
    
    static func getEntity(id: Int64, moc: NSManagedObjectContext) -> FavMovies? {
        let movieFecthRequest = FavMovies.fetchRequest()
        movieFecthRequest.fetchLimit = 1

        movieFecthRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let entity = try moc.fetch(movieFecthRequest)
            return entity.first
        }catch{
            print(error.localizedDescription)

            return nil
        }
    }
}
