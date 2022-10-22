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
    let criterialView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    
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
        criterialView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout(){
//        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(criterialView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}

