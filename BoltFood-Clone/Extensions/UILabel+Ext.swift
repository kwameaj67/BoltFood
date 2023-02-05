//
//  UILabel+Ext.swift
//  BoltFood-Clone
//
//  Created by Kwame Agyenim - Boateng on 27/08/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    func addLetterSpacing (about spacing: Double){
        if let labelText = text, labelText.isEmpty == false {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: attributedString.length - 1))
        }
    }
    func scaleFont(){
        self.adjustsFontForContentSizeCategory = true
    }
}


