//
//  ValueLabel.swift
//  nalisunovPW2
//
//  Created by Никита Лисунов on 22.09.2022.
//

import UIKit

final class ValueLabel: UIView {
    var label = UILabel()
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText(_ text: String, _ color: UIColor, _ font: UIFont) {
        label.text = text
        addSubview(label)
        label.pin(to: self)
        label.textColor = color
        label.textAlignment = .center
        label.font = font
    }
}
