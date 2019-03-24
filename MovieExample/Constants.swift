//
//  Constants.swift
//  MovieExample
//
//  Created by Esra Karakecili on 24.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import Foundation

let apiKey = "f2a0d925"
let baseUrl = "https://www.omdbapi.com/"

func unwrap(str: String?) -> String {
    if let myStr = str {
        return myStr
    }
    return ""
}
