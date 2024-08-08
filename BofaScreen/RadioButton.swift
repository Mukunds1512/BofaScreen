//
//  RadioButton.swift
//  BofaScreen
//
//  Created by Mukund Sharma on 8/8/24.
//

import Foundation
import UIKit

class RadioButton: UIButton {
    var alternateButton: [RadioButton]?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupButton()
    }

    private func setupButton() {
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.backgroundColor = .clear
        self.setTitleColor(.gray, for: .normal)
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc func buttonClicked() {
        self.isSelected = !self.isSelected
        updateUI()
        unselectAlternateButtons()
    }

    private func updateUI() {
        if self.isSelected {
            self.backgroundColor = .blue
            self.setTitleColor(.white, for: .normal)
        } else {
            self.backgroundColor = .clear
            self.setTitleColor(.gray, for: .normal)
        }
    }

    private func unselectAlternateButtons() {
        if let buttons = alternateButton {
            for button in buttons {
                button.isSelected = false
                button.updateUI()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
            return CGSize(width: 20, height: 20) // Fixed size for the radio button
        }
}
