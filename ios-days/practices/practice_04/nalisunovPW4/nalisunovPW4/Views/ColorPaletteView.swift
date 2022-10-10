//
//  ColorPaletteView.swift
//  nalisunovPW3
//
//  Created by Никита Лисунов on 28.09.2022.
//

import UIKit

final class ColorPaletteView: UIControl {
    private let stackView = UIStackView()
    private(set) var chosenColor: UIColor = .systemGray6
    var curRed: CGFloat = 0
    var curGreen: CGFloat = 0
    var curBlue: CGFloat = 0
    var curAlpha: CGFloat = 1
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        chosenColor.getRed(
            &curRed,
            green: &curGreen,
            blue: &curBlue,
            alpha: &curAlpha
        )
        let redControl = ColorSliderView(
            colorName: "R",
            value: Float(curRed)
        )
        let greenControl = ColorSliderView(
            colorName: "G",
            value: Float(curGreen)
        )
        let blueControl = ColorSliderView(
            colorName: "B",
            value: Float(curBlue)
        )
        redControl.tag = 0
        greenControl.tag = 1
        blueControl.tag = 2
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(redControl)
        stackView.addArrangedSubview(greenControl)
        stackView.addArrangedSubview(blueControl)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        
        [redControl, greenControl, blueControl].forEach {
            $0.addTarget(
                self,
                action: #selector(sliderMoved(slider:)),
                for: .touchDragInside
            )
        }
        addSubview(stackView)
        stackView.pin(to: self)
    }
    
    @objc
    private func sliderMoved(slider: ColorSliderView) {
        chosenColor.getRed(
            &curRed,
            green: &curGreen,
            blue: &curBlue,
            alpha: &curAlpha
        )
        switch slider.tag {
        case 0:
            self.chosenColor = UIColor(
                red: CGFloat(slider.value),
                green: curGreen,
                blue: curBlue,
                alpha: curAlpha
            )
        case 1:
            self.chosenColor = UIColor(
                red: curRed,
                green: CGFloat(slider.value),
                blue: curBlue,
                alpha: curAlpha
            )
        default:
            self.chosenColor = UIColor(
                red: curRed,
                green: curGreen,
                blue: CGFloat(slider.value),
                alpha: curAlpha
            )
        }
        sendActions(for: .touchDragInside)
    }
}
