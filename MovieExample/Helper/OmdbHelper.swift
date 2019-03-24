//
//  OmdbHelper.swift
//  MovieExample
//
//  Created by Esra Karakecili on 23.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit

class OmdbHelper {
    
    func searchMovie(movie: String) -> String {
        let searchUrl = "\(baseUrl)?t=\(movie)&apikey=\(apiKey)"
        print("\(searchUrl)")
        return searchUrl
    }
}
