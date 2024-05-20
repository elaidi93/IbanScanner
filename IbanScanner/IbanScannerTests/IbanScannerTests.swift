//
//  IbanScannerTests.swift
//  IbanScannerTests
//
//  Created by Hamza EL Aidi on 18/05/2024.
//

import XCTest
@testable import IbanScanner

class IbanScannerViewModelTests: XCTestCase {
    
    @MainActor
    func testResetScanner() {
        // Given
        let viewModel = IbanScannerViewModel()
        viewModel.isSheetPresented = true
        viewModel.scannedIban = "FR1234567890"
        
        // When
        viewModel.resetScanner()
        
        // Then
        XCTAssertFalse(viewModel.isSheetPresented)
        XCTAssertFalse(viewModel.scannedIban.isEmpty)
    }
}
