//
//  DetailVC.swift
//  MovieExample
//
//  Created by Esra Karakecili on 23.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class DetailVC: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbGenre: UILabel!
    @IBOutlet weak var lbRuntime: UILabel!
    @IBOutlet weak var lbRank: UILabel!
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var lbDirector: UILabel!
    @IBOutlet weak var lbWriter: UILabel!
    @IBOutlet weak var lbActors: UILabel!
    @IBOutlet weak var lbLanguage: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var lbAwards: UILabel!
    @IBOutlet weak var lbWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("detail_page", parameters: nil)
        roundLayers()
        setupLabels()
    }
    
    func roundLayers() {
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 12
        headerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        detailView.clipsToBounds = true
        detailView.layer.cornerRadius = 12
        detailView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func setupLabels() {
        imgPoster.setImageWith(URL(string: MovieItem.shared.Poster!)!)
        lbTitle.text = MovieItem.shared.Title
        lbYear.text = "(\(unwrap(str: MovieItem.shared.Year)))"
        lbGenre.text = MovieItem.shared.Genre
        lbRuntime.text = MovieItem.shared.Runtime
        lbRank.text = MovieItem.shared.imdbRating
        
        lbDirector.text = MovieItem.shared.Director
        lbWriter.text = MovieItem.shared.Writer
        lbActors.text = MovieItem.shared.Actors
        lbLanguage.text = MovieItem.shared.Language
        lbCountry.text = MovieItem.shared.Country
        lbAwards.text = MovieItem.shared.Awards
        lbWebsite.text = MovieItem.shared.Website
    }
}

