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
    @IBOutlet weak var tableView: UITableView!
    
    var movieItem: MovieItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.text = "spiderman"
    }
}

extension MainVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("\(unwrap(str: searchBar.text))")
        
        let omdHelper = OmdbHelper()
        omdHelper.searchMovie(movie: unwrap(str: searchBar.text)) { (movieItem) in
            self.movieItem = movieItem
            self.tableView.reloadData()
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieItem == nil ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.lbTitle.text = movieItem?.Title
        cell.lbYear.text = movieItem?.Year
        cell.lbCountry.text = movieItem?.Country
        cell.lbImdbRate.text = movieItem?.imdbRating
        cell.lbLanguage.text = movieItem?.Language
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
