//
//  BofaScreenViewController.swift
//  BofaScreen
//
//  Created by Mukund Sharma on 8/7/24.
//

import UIKit

class BofaScreenViewController: UIViewController {
    
    private let scrollableStackView = ScrollableStackView()
    private let identificationLabel = UILabel()
    private let citizenshipLabel = UILabel()
    private let spacerView = UIView()
    private let spacerView2 = UIView()
    private let yesButton = RadioButton(frame: .zero)
    private let noButton = RadioButton(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollableStackView()
        addIdentificationLabelToStackView()
        addSpacerViewToStackView()
        setupCitizenshipLabel()
        addSpacerViewToStackView2()
        setupRadioButton()
    }
    
    private func setupScrollableStackView() {
        
        scrollableStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollableStackView)
        
        NSLayoutConstraint.activate([
            scrollableStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollableStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollableStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollableStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    private func addIdentificationLabelToStackView(){
        
        identificationLabel.numberOfLines = 0
        identificationLabel.backgroundColor = .white
        identificationLabel.textAlignment =  .left
        
        let heading = "Identification\n"
        let paragraph = "Bank of America, like all financial institutions, is required by Federal law to obtain, verify and record information that identifies each customer who opens an account with us. When you open an account with us, we will ask you for your name, address and other information that will allow us to identify you. We may also ask to see your photo identification or other identifying documents."
        
        let headingAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 24)]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacingBefore = 10
        
        let paragraphAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .paragraphStyle: paragraphStyle]
        
        let attributedString = NSMutableAttributedString(string: heading, attributes: headingAttributes)
        attributedString.append(NSAttributedString(string: paragraph, attributes: paragraphAttributes))
        
        identificationLabel.attributedText = attributedString
        identificationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollableStackView.addArrangedSubview(identificationLabel)
        
        NSLayoutConstraint.activate([
                   identificationLabel.widthAnchor.constraint(equalTo: scrollableStackView.widthAnchor),
                   identificationLabel.leadingAnchor.constraint(equalTo: scrollableStackView.leadingAnchor),
                   identificationLabel.trailingAnchor.constraint(equalTo: scrollableStackView.trailingAnchor),
                   identificationLabel.topAnchor.constraint(equalTo: scrollableStackView.topAnchor, constant: 30)
               ])
    }
    
    private func addSpacerViewToStackView() {
            spacerView.translatesAutoresizingMaskIntoConstraints = false
            spacerView.heightAnchor.constraint(equalToConstant: 15).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView)
        }
    
    private func setupCitizenshipLabel() {
        
        citizenshipLabel.text = "Do you have U.S. citizenship? *"
        citizenshipLabel.backgroundColor = .white
        citizenshipLabel.textAlignment = .left
        citizenshipLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        citizenshipLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(citizenshipLabel)
        
    }
    
    private func addSpacerViewToStackView2() {
            spacerView2.translatesAutoresizingMaskIntoConstraints = false
            spacerView2.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView2)
        }
    
    private func setupRadioButton() {
        
        yesButton.setTitle("", for: .normal)
        yesButton.alternateButton = [noButton]
        
        noButton.setTitle("", for: .normal)
        noButton.alternateButton = [yesButton]
        
        let buttonSize: CGFloat = 20
        yesButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        yesButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        noButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        noButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        let yesLabel = UILabel()
        yesLabel.text = "Yes"
        yesLabel.textColor = .black
        
        let yesStackView = UIStackView(arrangedSubviews: [yesButton, yesLabel])
                yesStackView.axis = .horizontal
                yesStackView.spacing = 8
        
        let noLabel = UILabel()
        noLabel.text = "No"
        noLabel.textColor = .black
        
        let noStackView = UIStackView(arrangedSubviews: [noButton, noLabel])
                noStackView.axis = .horizontal
                noStackView.spacing = 8
        
        let mainStackView = UIStackView(arrangedSubviews: [yesStackView, noStackView])
                mainStackView.axis = .horizontal
                mainStackView.spacing = 20 // Adjust spacing as needed
                mainStackView.alignment = .leading
                mainStackView.distribution = .fillEqually
                
                // Add stack view to the view
                mainStackView.translatesAutoresizingMaskIntoConstraints = false
                scrollableStackView.addArrangedSubview(mainStackView)
        
                NSLayoutConstraint.activate([
                        mainStackView.leadingAnchor.constraint(equalTo: scrollableStackView.leadingAnchor, constant: 20),
                        mainStackView.trailingAnchor.constraint(equalTo: scrollableStackView.trailingAnchor, constant: -200),
                ])
    }
    
}
