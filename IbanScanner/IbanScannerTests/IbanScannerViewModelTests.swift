//
//  IbanScannerViewModelTests.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//


import XCTest
@testable import IbanScanner

class IbanScannerViewModelTests: XCTestCase {
    
    var viewModel: IbanScannerViewModel!

    override func setUp() {
        super.setUp()
        viewModel = IbanScannerViewModel()
    }

    func testInitialState() {
        XCTAssertFalse(viewModel.isSheetPresented, "The sheet should not be presented initially.")
        XCTAssertEqual(viewModel.scannedIban, "", "The scanned IBAN should be empty initially.")
    }

    func testResetScanner_withEmptyIBAN_startsScanning() {
        // GIVEN
        viewModel.scannedIban = ""
        
        // WHEN
        viewModel.resetScanner()
        
        // THEN
        XCTAssertFalse(viewModel.isSheetPresented, "Sheet should not be presented when IBAN is empty.")
    }

    func testResetScanner_withNonEmptyIBAN_stopsScanning() {
        // GIVEN
        viewModel.scannedIban = "FR7612345678901234567890123"
        
        // WHEN
        viewModel.resetScanner()
        
        // THEN
        XCTAssertFalse(viewModel.isSheetPresented, "Sheet should not be presented when IBAN is filled.")
    }

    func testScannedIBAN_updatesIBANAndPresentsSheet() {
        // GIVEN
        viewModel.scannedIban = "FR7612345678901234567890123"
        viewModel.isSheetPresented = true
        
        // THEN
        XCTAssertEqual(viewModel.scannedIban, "FR7612345678901234567890123", "Scanned IBAN should be updated in the ViewModel.")
        XCTAssertTrue(viewModel.isSheetPresented, "Sheet should be presented after scanning the IBAN.")
    }
}
