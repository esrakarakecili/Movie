//
//  MainVC.swift
//  MovieExample
//
//  Created by Esra Karakecili on 23.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class MainVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
//    var movieItem: MovieItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Analytics.logEvent("movie_search",
                           parameters: [AnalyticsParameterItemName:unwrap(str: searchBar.text)])
        print("\(unwrap(str: searchBar.text))")
//        loading(show: true)
        loadingAnim(show: true)
        view.endEditing(true)
        OmdbHelper.searchMovie(movie: unwrap(str: searchBar.text)) { (movieItem) in
//            loading(show: false)
            loadingAnim(show: false)
            MovieItem.shared = movieItem!
            if movieItem?.Title == nil {
                showAlert(title: "Sorry", message: "Movie not found")
            }
            self.tableView.reloadData()
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieItem.shared.Title == nil ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell") as! MainTableCell
        cell.imgPoster?.setImageWith(URL(string: (MovieItem.shared.Poster)!)!)
        cell.lbTitle.text = MovieItem.shared.Title
        cell.lbYear.text = MovieItem.shared.Year
        cell.lbCountry.text = MovieItem.shared.Country
        cell.lbImdbRate.text = MovieItem.shared.imdbRating
        cell.lbLanguage.text = MovieItem.shared.Language
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
        self.performSegue(withIdentifier: "MainVC_to_DetailVC", sender: nil)
    }
}
