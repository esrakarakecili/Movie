//
//  GradientView.swift
//  MovieExample
//
//  Created by Esra Karakecili on 27.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var color1: UIColor = UIColor.white {
        didSet {
            self.setGradient()
        }
    }
    
    @IBInspectable var color2: UIColor = UIColor.white {
        didSet {
            self.setGradient()
        }
    }
    
    @IBInspectable var startPointHorizontal: CGPoint = CGPoint(x: -0.5, y: 1) {
        didSet {
            self.setGradient()
        }
    }
    
    @IBInspectable var endPointHorizontal: CGPoint = CGPoint(x: 1, y: 0) {
        didSet {
            self.setGradient()
        }
    }
    
    @IBInspectable var startPointVertical: CGPoint = CGPoint(x: 0.5, y: 0) {
        didSet {
            self.setGradient()
        }
    }
    
    @IBInspectable var endPointVertical: CGPoint = CGPoint(x: 0.5, y: 1) {
        didSet {
            self.setGradient()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            setGradient()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    private func setGradient() {
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.colors = [self.color1.cgColor, self.color2.cgColor]
        
        if self.isHorizontal {
            gradientLayer.startPoint = self.startPointHorizontal
            gradientLayer.endPoint = self.endPointHorizontal
        } else {
            gradientLayer.startPoint = self.startPointVertical
            gradientLayer.endPoint = self.endPointVertical
        }
    }
}
