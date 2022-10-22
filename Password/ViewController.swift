//
//  ViewController.swift
//  Password
//
//  Created by Артем Орлов on 22.10.2022.
//

import UIKit
class ViewController: UIViewController {
      
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTexfField(placeHolderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTexfField(placeHolderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
       super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 5
        stackView.clipsToBounds = true
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: [])
    }
    
    func layout(){
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

