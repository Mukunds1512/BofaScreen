//
//  ViewController.swift
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


}

