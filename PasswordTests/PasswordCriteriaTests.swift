//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Артем Орлов on 05.11.2022.
//

import XCTest

@testable import Password

class PasswordLenghthCriteriaTests: XCTestCase {
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("1234567"))
    }
    
    func testLogn() throws {
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("1234567123456712345671234567123456"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("12345678"))
    }
    
    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("1234567123456712345671234567"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testLenghthAndNoMetYes() throws {
        XCTAssertTrue(PasswordCriteria.lenghthAndNoSpaceMet("12345678"))
    }
    
    func testLenghthAndNoMetNo() throws {
        XCTAssertFalse(PasswordCriteria.lenghthAndNoSpaceMet("1234567 8"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("AS"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("abc"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("ASD"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("123"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("abc"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("."))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet(""))
    }
}
