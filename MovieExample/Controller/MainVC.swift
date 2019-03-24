//
//  MainVC.swift
//  MovieExample
//
//  Created by Esra Karakecili on 23.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let omdHelper = OmdbHelper()
        omdHelper.searchMovie(movie: "spiderman")
    }
    
}

extension MainVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("\(unwrap(str: searchBar.text))")
    }
    
}
