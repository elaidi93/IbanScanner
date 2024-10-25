//
//  ErrorTextFieldTests.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//


import XCTest
@testable import IbanScanner

class ErrorTextFieldTests: XCTestCase {

    func testErrorMessageShown_whenTextIsInvalidAndNonEmpty() {
        // Given
        let errorTextfield = ErrorTextfield(
            placeholder: "Enter IBAN",
            text: .constant("FR1234"),
            isValid: false,
            errorMessage: "IBAN invalide. Veuillez vérifier et réessayer."
        )
        
        // When
        let showError = errorTextfield.showError
        
        // Then
        XCTAssertTrue(showError, "Error message should be shown when text is invalid and non-empty.")
    }
    
    func testErrorMessageNotShown_whenTextIsValid() {
        // Given
        let errorTextfield = ErrorTextfield(
            placeholder: "Enter IBAN",
            text: .constant("FR7612345678901234567890123"),
            isValid: true,
            errorMessage: "IBAN invalide. Veuillez vérifier et réessayer."
        )
        
        // When
        let showError = errorTextfield.showError
        
        // Then
        XCTAssertFalse(showError, "Error message should not be shown when text is valid.")
    }
    
    func testErrorMessageNotShown_whenTextIsEmpty() {
        // Given
        let errorTextfield = ErrorTextfield(
            placeholder: "Enter IBAN",
            text: .constant(""),
            isValid: false,  // Invalid but empty
            errorMessage: "IBAN invalide. Veuillez vérifier et réessayer."
        )
        
        // When
        let showError = errorTextfield.showError
        
        // Then
        XCTAssertFalse(showError, "Error message should not be shown when text is empty.")
    }
}
