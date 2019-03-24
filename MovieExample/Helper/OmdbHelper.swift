//
//  OmdbHelper.swift
//  MovieExample
//
//  Created by Esra Karakecili on 23.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit
import AFNetworking

class OmdbHelper {
    
    func searchMovie(movie: String) -> String {
        let searchUrl = "\(baseUrl)?t=\(movie)&apikey=\(apiKey)"
        print("\(searchUrl)")
        
        let configuration = URLSessionConfiguration.default
        let manager = AFURLSessionManager.init(sessionConfiguration: configuration)
        guard let url = URL.init(string: searchUrl) else { return "" }
        let request = URLRequest.init(url: url)
        let dataTask = manager.dataTask(with: request,
                                        uploadProgress: nil,
                                        downloadProgress: { (progress) in
                                            print("progress")
        }) { (response, object, error) in
            print("response: \(response)")
            print("object: \(object)")
            print("error: \(error)")
            let data = try! JSONSerialization.data(withJSONObject: (object as! [String:Any]), options: .prettyPrinted)
            let json = try! JSONDecoder().decode(MovieItem.self, from: data)
            print(json)
        }
        
        dataTask.resume()
        
        return searchUrl
    }
}
