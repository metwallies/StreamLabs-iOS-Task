//
//  Color+Extension.swift
//  StreamLabs
//
//  Created by islam metwally on 5/14/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

extension UIColor {
    class var darkBlue: UIColor {
        return UIColor(red: 23, green: 36, blue: 44)
    }
    
    class var darkOrange: UIColor {
        return UIColor(red: 227, green: 157, blue: 84)
    }
    
    class var violet: UIColor {
        return UIColor(red: 105, green: 39, blue: 136)
    }
    
    class var opaqueDarkOrange: UIColor {
        return UIColor(red: 227, green: 157, blue: 84, alpha: 0.3)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
}
