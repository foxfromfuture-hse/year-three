//
//  IncrementButton.swift
//  nalisunovPW2
//
//  Created by Никита Лисунов on 21.09.2022.
//

import UIKit

final class IncrementButton: UIView {
    var cornerRadius: CGFloat?
    var label = UILabel()

    var pressAction: (() -> Void)?
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
        let tapRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.incrementButtonPressed(_:))
        )
        addGestureRecognizer(tapRecognizer)
        guard let cornerRadius = cornerRadius else {
            return
        }
        layer.cornerRadius = cornerRadius
    }
    
    func setupText(_ text: String, _ color: UIColor, _ font: UIFont) {
        label.text = text
        addSubview(label)
        label.pin(to: self)
        label.textColor = color
        label.textAlignment = .center
        label.font = font
    }
    
    @objc
    private func incrementButtonPressed(_ sender: UITapGestureRecognizer? = nil) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
        UIView.animate(withDuration: 1, animations: {
            WelcomeViewController.value += 1
            WelcomeViewController.updateCommentLabel(value: WelcomeViewController.value)
            WelcomeViewController.updateValueLabel(value: WelcomeViewController.value)
        })
        pressAction?()
    }
}
