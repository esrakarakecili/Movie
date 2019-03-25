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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("detail_page", parameters: nil)
    }
}
