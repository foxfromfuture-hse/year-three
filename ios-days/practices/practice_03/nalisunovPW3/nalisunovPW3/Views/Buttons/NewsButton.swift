//
//  NewsButton.swift
//  nalisunovPW3
//
//  Created by Никита Лисунов on 28.09.2022.
//

import UIKit

final class NewsButton: MenuButton {
    override init(
        radius cornerRadius: CGFloat? = nil
    ) {
        super.init(radius: cornerRadius)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

