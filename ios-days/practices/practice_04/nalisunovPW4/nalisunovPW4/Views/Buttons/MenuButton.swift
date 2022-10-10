//
//  MenuButton.swift
//  nalisunovPW3
//
//  Created by Никита Лисунов on 29.09.2022.
//

import UIKit

class MenuButton: UIView {
    var cornerRadius: CGFloat?

    init(
        radius cornerRadius: CGFloat? = nil
    ) {
        self.cornerRadius = cornerRadius
        super.init(frame: .zero)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configureUI() {
        guard let cornerRadius = cornerRadius else {
            return
        }
        layer.cornerRadius = cornerRadius
    }
    
    func setupText(
        _ text: String,
        _ color: UIColor,
        _ font: UIFont
    ) {
        let label = UILabel()
        label.text = text
        addSubview(label)
        label.pin(to: self)
        label.textColor = color
        label.textAlignment = .center
        label.font = font
    }
}
