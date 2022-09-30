//
//  ColorsButton.swift
//  nalisunovPW3
//
//  Created by Никита Лисунов on 28.09.2022.
//

import UIKit

final class ColorsButton: MenuButton {
    var pressAction: (() -> Void)?

    override init(
        radius cornerRadius: CGFloat? = nil
    ) {
        super.init(radius: cornerRadius)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override internal func configureUI() {
        let tapRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.colorsButtonPressed(_:))
        )
        addGestureRecognizer(tapRecognizer)
        guard let cornerRadius = cornerRadius else {
            return
        }
        layer.cornerRadius = cornerRadius
    }
    
    @objc
    private func colorsButtonPressed(
        _ sender: UITapGestureRecognizer? = nil
    ) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        UIView.animate(withDuration: 1, animations: {
            WelcomeViewController.colorPaletteView.isHidden.toggle()
        })
        pressAction?()
    }
}

