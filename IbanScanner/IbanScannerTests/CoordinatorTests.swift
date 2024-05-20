//
//  CoordinatorTests.swift
//  IbanScannerTests
//
//  Created by Hamza EL Aidi on 20/05/2024.
//

import XCTest
@testable import IbanScanner

class CoordinatorTests: XCTestCase {
    
    @MainActor
    func testIsBadIBAN() {
        // Given
        let parentViewController = IbanScannerViewController(viewModel: IbanScannerViewModel())
        let coordinator = Coordinator(parentViewController)
        
        // When
        let result = coordinator.isIBAN("FR1234567890")
        
        // Then
        XCTAssertFalse(result)
    }
    
    @MainActor
    func testIsIBAN() {
        // Given
        let parentViewController = IbanScannerViewController(viewModel: IbanScannerViewModel())
        let coordinator = Coordinator(parentViewController)
        
        // When
        let result = coordinator.isIBAN("FR1234567890364656455")
        
        // Then
        XCTAssertTrue(result)
    }
}
