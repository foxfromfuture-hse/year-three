//
//  CALayer+Shadow.swift
//  nalisunovPW2
//
//  Created by Никита Лисунов on 23.09.2022.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .systemGray,
        opacity: Float = 0.3,
        radius: CGFloat = 10
    ) {
        self.shadowColor = color.cgColor
        self.shadowOpacity = opacity
        self.shadowOffset = .zero
        self.shadowRadius = radius
    }
}
