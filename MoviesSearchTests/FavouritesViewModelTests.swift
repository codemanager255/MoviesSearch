//
//  FavouritesViewModelTests.swift
//  MoviesSearchTests
//
//  Created by Mateus Goncalves De Ouro on 28/03/2022.
//

import XCTest
@testable import MoviesSearch

class FavouritesViewModelTests : XCTestCase {
    
    
    
    var favMovieViewModel: FavouritesViewModel!
        
        override func setUpWithError() throws {
            let mockFavRepo = MockFavMovieRepository()
            favMovieViewModel = FavouritesViewModel(favRepo: mockFavRepo)
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
        
        
        func testGetFavMovies() {
            
            favMovieViewModel.getFavMovies()
            
            XCTAssertEqual(favMovieViewModel.movies.count, 2)
        }
}
