//
//  MenuButtonsSV.swift
//  nalisunovPW3
//
//  Created by Никита Лисунов on 29.09.2022.
//

import UIKit

final class MenuButtonsSV: UIStackView {
    var views: [UIView]
    
    init(views: [UIView]) {
        self.views = views
        super.init(frame: .zero)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.spacing = 12
        self.axis = .horizontal
        self.distribution = .fillEqually
        while (views.isEmpty == false) {
            self.addArrangedSubview(self.views.removeFirst())
        }
    }
}
