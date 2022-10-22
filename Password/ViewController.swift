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
    
    override func viewDidLoad() {
       super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
    }
    
    func layout(){
        stackView.addArrangedSubview(newPasswordTextField)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}

