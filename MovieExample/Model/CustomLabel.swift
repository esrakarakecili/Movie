//
//  CustomLabel.swift
//  MovieExample
//
//  Created by Esra Karakecili on 3.04.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customizeLabels()
    }
    
    func customizeLabels() {
        font = UIFont.boldSystemFont(ofSize: 16)
    }
}
