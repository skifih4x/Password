//
//  PasswordCriteria.swift
//  Password
//
//  Created by Артем Орлов on 23.10.2022.
//

import Foundation

struct PasswordCriteria {
    static func lenghtCriteriaMet(_ text: String) -> Bool {
        text.count >= 8 && text.count <= 33
    }
    
    static func noSpaceCriteriaMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespaces) == nil
    }
    
    static func lenghthAndNoSpaceMet(_ text: String) -> Bool {
        lenghtCriteriaMet(text) && noSpaceCriteriaMet(text)
    }
    
    static func uppercaseMet(_ text: String) -> Bool {
        text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    static func lowercaseMet(_ text: String) -> Bool {
        text.range(of: "[a-z]+", options: .regularExpression) != nil
    }
    
    static func digitMet(_ text: String) -> Bool {
        text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    static func specialCharacterMet(_ text: String) -> Bool {
        //regex escaped @:?!$#,.\/-=
        text.range(of: "[@:?!()$#,./\\\\]+", options: .regularExpression) != nil
    }
}
 
