//
//  CommentView.swift
//  nalisunovPW2
//
//  Created by Никита Лисунов on 22.09.2022.
//

import UIKit

final class CommentView: UIView {
    var label = UILabel()
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
    
    private func configureUI() {
        guard let cornerRadius = cornerRadius else {
            return
        }
        layer.cornerRadius = cornerRadius
    }
    
    func setupText(
        _ text: String,
        _ color: UIColor = .systemGray,
        _ font: UIFont = .systemFont(ofSize: 14.0, weight: .regular)
    ) {
        label.text = text
        addSubview(label)
        label.pin(
            to: self,
            [.top: 16, .left: 16, .bottom: 16, .right: 16]
        )
        label.textColor = color
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = font
    }
}
