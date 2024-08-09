//
//  BofaScreenViewController.swift
//  BofaScreen
//
//  Created by Mukund Sharma on 8/7/24.
//

import UIKit

class BofaScreenViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
    private let scrollableStackView = ScrollableStackView()
    private let identificationLabel = UILabel()
    private let citizenshipLabel = UILabel()
    private var countryTextField = UITextField()
    private var citizenshipTextField = UITextField()
    private var residenceTextField = UITextField()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        countryTextField.delegate = self
        citizenshipTextField.delegate = self
        setupScrollableStackView()
        addIdentificationLabelToStackView()
        addSpacerViewToStackView()
        setupCitizenshipLabel()
        addSpacerViewToStackView2()
        setupRadioButton()
        addSpacerViewToStackView3()
        setupLabelWithTextField(labelText: "Country of Citizenship *", textFieldPlaceholder: "Panama")
        addSpacerViewToStackView4()
        setupLabelWithTextField(labelText: "Citizenship status *", textFieldPlaceholder: "Select")
        addSpacerViewToStackView5()
        setupQuestionView()
        addSpacerViewToStackView6()
        setupIdLabel()
        addSpacerViewToStackView7()
        setupRadioButton2()
        addSpacerViewToStackView8()
        setupLabelWithTextField(labelText: "Country of residence ", textFieldPlaceholder: "Select")
        addSpacerViewToStackView9()
        setupNextButton()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL)
        return false
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
            let spacerView = UIView()
            spacerView.translatesAutoresizingMaskIntoConstraints = false
            spacerView.heightAnchor.constraint(equalToConstant: 17).isActive = true // Adjust spacing here
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
            let spacerView2 = UIView()
            spacerView2.translatesAutoresizingMaskIntoConstraints = false
            spacerView2.heightAnchor.constraint(equalToConstant: 12).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView2)
        }
    
    private func setupRadioButton() {
        
        let yesButton = RadioButton(frame: .zero)
        let noButton = RadioButton(frame: .zero)
        
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
    
    private func addSpacerViewToStackView3() {
            let spacerView3 = UIView()
            spacerView3.translatesAutoresizingMaskIntoConstraints = false
            spacerView3.heightAnchor.constraint(equalToConstant: 20).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView3)
        }
    
    private func addSpacerViewToStackView4() {
            let spacerView4 = UIView()
            spacerView4.translatesAutoresizingMaskIntoConstraints = false
            spacerView4.heightAnchor.constraint(equalToConstant: 15).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView4)
        }
    
    private func addSpacerViewToStackView5() {
            let spacerView5 = UIView()
            spacerView5.translatesAutoresizingMaskIntoConstraints = false
            spacerView5.heightAnchor.constraint(equalToConstant: 5).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView5)
        }
    
    private func setupQuestionView() {
        let questionTextView = UITextView()
        
        let attributedString = NSMutableAttributedString(string: "Help me answer this question")
        attributedString.addAttribute(.link, value: "https://www.bankofamerica.com/", range: (attributedString.string as NSString).range(of: "Help me answer this question"))
        let underlineStyle = NSUnderlineStyle.patternDash.rawValue | NSUnderlineStyle.single.rawValue
        questionTextView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue, .underlineStyle: underlineStyle]
        questionTextView.backgroundColor = .clear
        questionTextView.attributedText = attributedString
        questionTextView.textColor = .label
        questionTextView.font = UIFont.boldSystemFont(ofSize: 15)
        questionTextView.isSelectable = true
        questionTextView.isEditable = false
        questionTextView.isScrollEnabled = false
        
        questionTextView.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(questionTextView)
    }
    
    private func addSpacerViewToStackView6() {
            let spacerView6 = UIView()
            spacerView6.translatesAutoresizingMaskIntoConstraints = false
            spacerView6.heightAnchor.constraint(equalToConstant: 15).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView6)
        }
    
    private func setupIdLabel() {
        let idLabel = UILabel()
        idLabel.text = "Select the ID you have *"
        idLabel.font = UIFont.boldSystemFont(ofSize: 18)
        idLabel.backgroundColor = .white
        idLabel.textAlignment = .left
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(idLabel)
    }
    
    private func addSpacerViewToStackView7() {
            let spacerView7 = UIView()
            spacerView7.translatesAutoresizingMaskIntoConstraints = false
            spacerView7.heightAnchor.constraint(equalToConstant: 15).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView7)
        }
    
    private func setupRadioButton2() {
        
        let ssnButton = RadioButton(frame: .zero)
        let itinButton = RadioButton(frame: .zero)
        let neitherButton = RadioButton(frame: .zero)
        ssnButton.setTitle("", for: .normal)
        ssnButton.alternateButton = [itinButton, neitherButton]
        
        itinButton.setTitle("", for: .normal)
        itinButton.alternateButton = [ssnButton, neitherButton]
        
        neitherButton.setTitle("", for: .normal)
        neitherButton.alternateButton = [ssnButton, itinButton]
        
        let buttonSize: CGFloat = 20
        ssnButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        ssnButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        itinButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        itinButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        neitherButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        neitherButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        let ssnLabel = UILabel()
        ssnLabel.text = "Social Security number (SSN)"
        ssnLabel.textColor = .black
        
        let ssnStackView = UIStackView(arrangedSubviews: [ssnButton, ssnLabel])
        ssnStackView.axis = .horizontal
        ssnStackView.spacing = 8
        
        let itinLabel = UILabel()
        itinLabel.text = "Individual Taxpayer ID Number (ITIN)"
        itinLabel.textColor = .black
        
        let itinStackView = UIStackView(arrangedSubviews: [itinButton, itinLabel])
        itinStackView.axis = .horizontal
        itinStackView.spacing = 8
        
        let neitherLabel = UILabel()
        neitherLabel.text = "Neither"
        neitherLabel.textColor = .black
        
        let neitherStackView = UIStackView(arrangedSubviews: [neitherButton, neitherLabel])
        neitherStackView.axis = .horizontal
        neitherStackView.spacing = 8
        
        let mainStackView = UIStackView(arrangedSubviews: [ssnStackView, itinStackView, neitherStackView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 15// Adjust spacing as needed
        mainStackView.alignment = .leading
        //mainStackView.distribution = .fillEqually
                
        // Add stack view to the view
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        mainStackView.leadingAnchor.constraint(equalTo: scrollableStackView.leadingAnchor, constant: 20)
        ])
    }
    
    private func addSpacerViewToStackView8() {
            let spacerView8 = UIView()
            spacerView8.translatesAutoresizingMaskIntoConstraints = false
            spacerView8.heightAnchor.constraint(equalToConstant: 15).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView8)
        }
    
    private func addSpacerViewToStackView9() {
            let spacerView9 = UIView()
            spacerView9.translatesAutoresizingMaskIntoConstraints = false
            spacerView9.heightAnchor.constraint(equalToConstant: 15).isActive = true // Adjust spacing here
            scrollableStackView.addArrangedSubview(spacerView9)
        }
    
    private func setupNextButton(){
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor(red: 0.0, green: 0.2, blue: 0.6, alpha: 1.0)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(nextButton)
    }
}

extension BofaScreenViewController {
    
    private func setupLabelWithTextField(labelText: String, textFieldPlaceholder: String) {
        let label = UILabel()
        label.text = labelText
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .white
        label.textAlignment = .left
        
        let textField = UITextField()
        textField.placeholder = textFieldPlaceholder
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(label)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        scrollableStackView.addArrangedSubview(textField)
        
        // Store text fields if needed for future use
        if labelText == "Country of Citizenship *" {
            countryTextField = textField
        } else if labelText == "Citizenship status *" {
            citizenshipTextField = textField
        } else if labelText == "Country of residence *" {
            residenceTextField = textField
        }
    }
    
}
