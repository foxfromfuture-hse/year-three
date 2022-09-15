//
//  ViewController.swift
//  nalisunovPW1
//
//  Created by Никита Лисунов on 11.09.2022.
//

import UIKit

enum Constants {
    static let colorLightGray: CGFloat = 230
    static let colorMaxValue: CGFloat = 255
}

extension UIColor {
    convenience init(hex: String) {
        var rgb: UInt64 = 0
        var clearedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        clearedHex = clearedHex.replacingOccurrences(of: "#", with: "")
        Scanner(string: clearedHex).scanHexInt64(&rgb)
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / Constants.colorMaxValue,
            green: CGFloat((rgb & 0x00FF00) >> 8) / Constants.colorMaxValue,
            blue: CGFloat(rgb & 0x0000FF) / Constants.colorMaxValue,
            alpha: 1
        )
    }
}

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in self.views {
            view.backgroundColor = .white
        }
        mainButton.setTitle(
            "Press to see magic", for: .normal
        )
        mainButton.layer.cornerRadius = 10
        mainButton.backgroundColor = UIColor(
            red: Constants.colorLightGray / Constants.colorMaxValue,
            green: Constants.colorLightGray / Constants.colorMaxValue,
            blue: Constants.colorLightGray / Constants.colorMaxValue,
            alpha: 1
        )
        self.mainButton?.isEnabled = false
        setRandomColorsAndCornerRadius(
            currentColorSet: getRandomColorSet()
        )
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        self.mainButton?.isEnabled = false
        setRandomColorsAndCornerRadius(
            currentColorSet: getRandomColorSet()
        )
    }
    
    func getRandomHexColor() -> String {
        let hexSymbols = [
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
        ]
        return "#"
            .appending(hexSymbols[Int.random(in: 0..<16)])
            .appending(hexSymbols[Int.random(in: 0..<16)])
            .appending(hexSymbols[Int.random(in: 0..<16)])
            .appending(hexSymbols[Int.random(in: 0..<16)])
            .appending(hexSymbols[Int.random(in: 0..<16)])
            .appending(hexSymbols[Int.random(in: 0..<16)])
    }
    
    func getRandomColorSet() -> Set<UIColor> {
        var colorSet = Set<UIColor>()
        while colorSet.count < views.count {
            colorSet.insert(
                UIColor(hex: getRandomHexColor())
            )
        }
        return colorSet
    }
    
    func getRandomCornerRadius(currentView: UIView) -> CGFloat {
        if currentView.bounds.height < currentView.bounds.width {
            return CGFloat.random(in: 0...currentView.bounds.height / 2)
        } else {
            return CGFloat.random(in: 0...currentView.bounds.width / 2)
        }
    }
    
    func setRandomColorsAndCornerRadius(currentColorSet: Set<UIColor>) {
        var colorSet = currentColorSet
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.layer.cornerRadius = self.getRandomCornerRadius(currentView: view)
                view.backgroundColor = colorSet.popFirst()
            }
        }) { completion in
            self.mainButton?.isEnabled = true
        }
    }
}
