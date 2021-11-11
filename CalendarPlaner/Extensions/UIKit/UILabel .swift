//
//  UILabel .swift
//  CalendarPlaner
//
//  Created by Никита Иващенков on 11/11/2021.
//  Copyright © 2021 Никита Иващенков. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment = .left) {
        self.init()
        
        self.text = text
        self.font = font
        self.textAlignment = aligment
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
