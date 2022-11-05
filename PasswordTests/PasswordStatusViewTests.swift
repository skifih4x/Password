//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Артем Орлов on 05.11.2022.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }

    /*
     if shouldResetCriteria {
         // Inline validation (✅ or ⚪️)
     } else {
         ...
     }
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // loss of focus
    }

    /*
     if shouldResetCriteria {
         ...
     } else {
         // Focus lost (✅ or ❌)
     }
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        // 🕹 Ready Player1
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage)
    }

    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        // 🕹 Ready Player1
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage)
    }
}

class PasswordStatusViewTests_ShowThreeTestFromFour_When_Focus: XCTestCase {
    var statusView: PasswordStatusView!

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }
    
    func test() throws {
        XCTAssertTrue(statusView.validate("Qwerty12345%"))
    }
    
    func testNot() throws {
        XCTAssertFalse(statusView.validate("Qwerty"))
    }
    
    func testNotNumber() throws {
        XCTAssertFalse(statusView.validate("Qwerty%"))
    }
    
    func testNotUppercase() throws {
        XCTAssertFalse(statusView.validate("qwerty12345%"))
    }
    
    func testNotLowpercase() throws {
        XCTAssertFalse(statusView.validate("QWERTY12345%"))
    }
}

