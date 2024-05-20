//
//  IbanScannerViewControllerTests.swift
//  IbanScannerTests
//
//  Created by Hamza EL Aidi on 20/05/2024.
//

import XCTest
@testable import IbanScanner

class IbanScannerViewControllerTests: XCTestCase {
    
    @MainActor
    func testStartScanning() {
        // Given
        let viewModel = IbanScannerViewModel()
        let viewController = IbanScannerViewController(viewModel: viewModel)
        
        // When
        viewController.startScanning()
        
        // Then
        XCTAssertTrue(viewController.scannerViewController.isScanning)
    }
    
    @MainActor
    func testStopScanning() {
        // Given
        let viewModel = IbanScannerViewModel()
        let viewController = IbanScannerViewController(viewModel: viewModel)
        
        // When
        viewController.stopScanning()
        
        // Then
        XCTAssertFalse(viewController.scannerViewController.isScanning)
    }
}
