//
//  NotesButton.swift
//  nalisunovPW3
//
//  Created by Никита Лисунов on 28.09.2022.
//

import UIKit

final class NotesButton: MenuButton {
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
            action: #selector(self.notesButtonPressed(_:))
        )
        addGestureRecognizer(tapRecognizer)
        guard let cornerRadius = cornerRadius else {
            return
        }
        layer.cornerRadius = cornerRadius
    }
    
    @objc
    private func notesButtonPressed(
        _ sender: UITapGestureRecognizer? = nil
    ) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        let notesViewController: NotesViewController = NotesViewController()
        self.window?.rootViewController?.present(notesViewController, animated: true)
        pressAction?()
    }
}
