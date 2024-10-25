//
//  IbanScannerViewController.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//


import SwiftUI
import VisionKit

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
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: DataScannerViewController, context: Context) -> CGSize? {
        let proposalHeight = proposal.height ?? 0
        let proposalWidth = proposal.width ?? 0
        
        uiViewController.regionOfInterest = .init(
            x: 0,
            y: (proposalHeight - Constant.scannerIndicatorHeight) / 2,
            width: proposalWidth,
            height: Constant.scannerIndicatorHeight
        )
        
        return .init(width: proposalWidth, height: proposalHeight)
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
                if text.transcript.isValidFrenchIBAN {
                    parent.scannerViewController.stopScanning()
                    parent.viewModel?.scannedIban = text.transcript
                    parent.viewModel?.isSheetPresented = true
                }
            default:
                print("Should not happen")
            }
        }
    }
}
