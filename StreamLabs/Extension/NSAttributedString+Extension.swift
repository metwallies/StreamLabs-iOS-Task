//
//  NSAttributedString+Extension.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

extension String {
    func colorRange(of toBeColored: String, color: UIColor, in totalString: String) -> NSAttributedString {
        
        let result: NSMutableAttributedString = NSMutableAttributedString(string: totalString)
        
        let range: NSRange = (totalString as NSString).range(of: toBeColored)
        result.addAttributes([NSAttributedString.Key.foregroundColor : color], range: range)
        
        return result
    }
}
