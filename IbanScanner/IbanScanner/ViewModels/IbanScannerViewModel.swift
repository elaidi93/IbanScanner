//
//  IbanScannerViewModel.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//


import Foundation

class IbanScannerViewModel: ObservableObject {
    @Published var isSheetPresented: Bool = false
    @Published var scannedIban: String = ""
    
    var scannerViewController: IbanScannerViewController
    
    init() {
        scannerViewController = IbanScannerViewController()
        scannerViewController.viewModel = self
    }
    
    func resetScanner() {
        isSheetPresented = false
        if scannedIban.isEmpty {
            scannerViewController.startScanning()
        } else {
            scannerViewController.stopScanning()
        }
    }
}
