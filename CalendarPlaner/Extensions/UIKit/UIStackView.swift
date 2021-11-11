//
//  UIStackView.swift
//  CalendarPlaner
//
//  Created by Никита Иващенков on 11/11/2021.
//  Copyright © 2021 Никита Иващенков. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubview: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubview)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
