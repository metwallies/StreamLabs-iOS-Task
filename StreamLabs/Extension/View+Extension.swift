//
//  View+Extension.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

extension UIView {
    func addClearGradient(withColor color: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [
            color.withAlphaComponent(0).cgColor,
            color.withAlphaComponent(0.5).cgColor,
            color.withAlphaComponent(1).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addGradient(withColor color: UIColor, color2: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [
            color.withAlphaComponent(1).cgColor,
            color2.withAlphaComponent(0.5).cgColor,
            color2.withAlphaComponent(1).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
