//
//  IbanScannerViewController.swift
//  IbanScanner
//
//  Created by Hamza EL Aidi on 20/05/2024.
//

import SwiftUI
import VisionKit

@MainActor
struct IbanScannerViewController: UIViewControllerRepresentable {
    
    var viewModel: IbanScannerViewModel?
    
    var scannerViewController: DataScannerViewController = DataScannerViewController(
        recognizedDataTypes: [.text()],
        qualityLevel: .accurate,
        recognizesMultipleItems: false,
        isHighFrameRateTrackingEnabled: false,
        isHighlightingEnabled: false
    )
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        scannerViewController.delegate = context.coordinator
        try? scannerViewController.startScanning()
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func startScanning(){
        try? scannerViewController.startScanning()
    }
    
    func stopScanning() {
        scannerViewController.stopScanning()
    }
}

class Coordinator: NSObject, DataScannerViewControllerDelegate {
    var parent: IbanScannerViewController
    
    init(_ parent: IbanScannerViewController) {
        self.parent = parent
    }
    
    func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
        guard let item = addedItems.first
        else { return }
        processItem(item: item)
    }
    
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        processItem(item: item)
    }
    
    func processItem(item: RecognizedItem) {
        switch item {
        case .text(let text):
            if isIBAN(text.transcript) {
                parent.scannerViewController.stopScanning()
                parent.viewModel?.scannedIban = text.transcript
                parent.viewModel?.isSheetPresented = true
            }
        default:
            print("Should not happen")
        }
    }
    
    func isIBAN(_ text: String) -> Bool {
        text.hasPrefix("FR") && text.count >= 14
    }
}
