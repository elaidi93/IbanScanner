//
//  IbanValidationTests.swift
//  IbanScannerTests
//
//  Created by hamza el aidi on 25/10/2024.
//

import XCTest
@testable import IbanScanner

class IBANValidationTests: XCTestCase {

    func testValidFrenchIBAN() {
        // GIVEN
        let validIBAN = "FR7612345678901234567890123"
        
        // WHEN
        let isValid = validIBAN.isValidFrenchIBAN
        
        // THEN
        XCTAssertTrue(isValid, "Valid French IBAN should return true.")
    }
    
    func testInvalidFrenchIBAN() {
        // GIVEN
        let invalidIBAN = "FR761234INVALID67890123"
        
        // WHEN
        let isValid = invalidIBAN.isValidFrenchIBAN
        
        // THEN
        XCTAssertFalse(isValid, "Invalid French IBAN should return false.")
    }
    
    func testIBANWithWrongLength() {
        // GIVEN
        let shortIBAN = "FR761234567"
        
        // WHEN
        let isValid = shortIBAN.isValidFrenchIBAN
        
        // THEN
        XCTAssertFalse(isValid, "IBAN with incorrect length should return false.")
    }
}
