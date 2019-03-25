//
//  LaunchVC.swift
//  MovieExample
//
//  Created by Esra Karakecili on 24.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

class LaunchVC: UIViewController {
    
    @IBOutlet weak var lbBrand: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isReachable() {
            let alert = UIAlertController(title: "Network Problem", message: "Please make sure you are connected to the internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        } else {
            lbBrand.text = RemoteConfig.remoteConfig().configValue(forKey: "launch_text").stringValue
            // FIXME: do it 3.0 secs
            delay(seconds: 3.0) {
                self.performSegue(withIdentifier: "LaunchVC_to_MainVC", sender: nil)
                //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //            let vc = storyboard.instantiateViewController(withIdentifier: "asd")
                //            present(vc, animated: true, completion: nil)
            }
        }
    }
}
