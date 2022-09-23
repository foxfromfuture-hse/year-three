//
//  WelcomeViewController.swift
//  nalisunovPW2
//
//  Created by Никита Лисунов on 21.09.2022.
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

final class WelcomeViewController: UIViewController {
    static var value: Int = 0
    static let valueLabel = ValueLabel()
    static let commentView = CommentView(radius: 12)
    private let newsButton = MenuButton(radius: 12)
    private let notesButton = MenuButton(radius: 12)
    private let colorsButton = MenuButton(radius: 12)
    static let incrementButton = IncrementButton(radius: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemGray6
        setupIncrementButton()
        setupValueLabel()
        setupCommentView()
        setupMenuButtons()
    }
    
    private func setupIncrementButton() {
        view.addSubview(WelcomeViewController.incrementButton)
        WelcomeViewController.incrementButton.setHeight(to: 48)
        WelcomeViewController.incrementButton.pinTop(
            to: self.view.centerYAnchor
        )
        WelcomeViewController.incrementButton.pin(
            to: self.view,
            [.left: 24, .right: 24]
        )
        WelcomeViewController.incrementButton.backgroundColor = .white
        WelcomeViewController.incrementButton.layer.applyShadow()
        WelcomeViewController.incrementButton.setupText(
            "Increment",
            .black,
            .systemFont(ofSize: 16.0, weight: .medium)
        )
    }
    
    private func setupValueLabel() {
        view.addSubview(WelcomeViewController.valueLabel)
        WelcomeViewController.valueLabel.pinBottom(
            to: WelcomeViewController.incrementButton.topAnchor,
            16
        )
        WelcomeViewController.valueLabel.pinCenter(
            to: self.view.centerXAnchor
        )
        WelcomeViewController.valueLabel.setupText(
            "\(WelcomeViewController.value)",
            .black,
            .systemFont(ofSize: 40.0, weight: .bold)
        )
    }
    
    private func setupCommentView() {
        view.addSubview(WelcomeViewController.commentView)
        WelcomeViewController.commentView.pinTop(
            to: self.view.safeAreaLayoutGuide.topAnchor
        )
        WelcomeViewController.commentView.pin(
            to: self.view,
            [.left: 24, .right: 24]
        )
        WelcomeViewController.commentView.backgroundColor = .white
        WelcomeViewController.commentView.setupText(
            "0",
            .systemGray,
            .systemFont(ofSize: 14.0, weight: .regular)
        )
    }
    
    private func setupMenuButton(button: MenuButton, title: String) {
        view.addSubview(button)
        button.backgroundColor = .white
        button.heightAnchor.constraint(
            equalTo: colorsButton.widthAnchor
        ).isActive = true
        button.setupText(
            title,
            .black,
            .systemFont(ofSize: 16.0, weight: .medium)
        )
    }
    
    private func setupMenuButtons() {
        setupMenuButton(button: colorsButton, title: "🎨")
        setupMenuButton(button: notesButton, title: "📝")
        setupMenuButton(button: newsButton, title: "📰")
        let buttonsSV = UIStackView(
            arrangedSubviews: [colorsButton, notesButton, newsButton]
        )
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        self.view.addSubview(buttonsSV)
        buttonsSV.pin(
            to: self.view,
            [.left: 24, .right: 24]
        )
        buttonsSV.pinBottom(
            to: self.view.safeAreaLayoutGuide.bottomAnchor,
            24
        )
    }
    
    static func updateCommentLabel(value: Int) {
        switch value {
        case 0...10:
            WelcomeViewController.commentView.setupText("1")
        case 10...20:
            WelcomeViewController.commentView.setupText("2")
        case 20...30:
            WelcomeViewController.commentView.setupText("3")
        case 30...40:
            WelcomeViewController.commentView.setupText("4")
        case 40...50:
            WelcomeViewController.commentView.setupText("🎉🎉🎉🎉🎉🎉🎉🎉🎉")
        case 50...60:
            WelcomeViewController.commentView.setupText("big boy")
        case 60...70:
            WelcomeViewController.commentView.setupText("70 70 70 moreeeee")
        case 70...80:
            WelcomeViewController.commentView.setupText("⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️")
        case 80...90:
            WelcomeViewController.commentView.setupText("80+\n go higher!")
        case 90...100:
            WelcomeViewController.commentView.setupText("100!! to the moon!!")
        default:
            break
        }
    }
    
    static func updateValueLabel(value: Int) {
        WelcomeViewController.valueLabel.setupText(
            "\(WelcomeViewController.value)",
            .black,
            .systemFont(ofSize: 40.0, weight: .bold)
        )
    }
}
