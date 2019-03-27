//
//  Movie.swift
//  MovieExample
//
//  Created by Esra Karakecili on 24.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import Foundation

class MovieItem: Decodable {
    
    var Title: String?
    var Year: String?
    var Rated: String?
    var Released: String?
    var Runtime: String?
    var Genre: String?
    var Director: String?
    var Writer: String?
    var Actors: String?
    var Plot: String?
    var Language: String?
    var Country: String?
    var Awards: String?
    var Poster: String?
    var Ratings: [[String:String]]?
    var Metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var DVD: String?
    var BoxOffice: String?
    var Production: String?
    var Website: String?
    var Response: String?
    
    static var shared = MovieItem()
    
    init() {
        
    }
    
    
}
