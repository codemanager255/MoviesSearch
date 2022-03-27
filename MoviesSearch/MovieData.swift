//
//  MovieData.swift
//  MoviesSearch
//
//  Created by Admin on 25/03/2022.
//

import Foundation

struct MovieData: Decodable {
    let results: [result]
}

struct result: Decodable {
    let title: String
    let releaseDate: String
    let overview: String
    let posterPath: String
    let rating: String
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case releaseDate = "release_date"
        case overview
        case posterPath = "poster_path"
        case rating = "vote_average"
    }
}
