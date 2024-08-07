//
//  BofaScreenViewController.swift
//  BofaScreen
//
//  Created by Mukund Sharma on 8/7/24.
//

import UIKit

class BofaScreenViewController: UIViewController {
    
    private let scrollableStackView = ScrollableStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollableStackView()
        addIdentificationLabelToStackView()
        
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
        let identificationLabel = UILabel()
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
        identificationLabel.translatesAutoresizingMaskIntoConstraints = true
        
        scrollableStackView.addArrangedSubview(identificationLabel)
        
        NSLayoutConstraint.activate([
                   identificationLabel.widthAnchor.constraint(equalTo: scrollableStackView.widthAnchor),
                   identificationLabel.leadingAnchor.constraint(equalTo: scrollableStackView.leadingAnchor),
                   identificationLabel.trailingAnchor.constraint(equalTo: scrollableStackView.trailingAnchor),
                   identificationLabel.topAnchor.constraint(equalTo: scrollableStackView.topAnchor, constant: 30)
               ])
    }
    
}
