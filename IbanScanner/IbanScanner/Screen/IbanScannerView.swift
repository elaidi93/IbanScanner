//
//  IbanScannerView.swift
//  IbanScanner
//
//  Created by Hamza EL Aidi on 19/05/2024.
//

import SwiftUI
import VisionKit
import Vision
import Combine

struct IbanScannerView: View {
    @StateObject var viewModel: IbanScannerViewModel = .init()
    @Binding var isScannerPresented: Bool
    @Binding var iban: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                viewModel.scannerViewController
                
                Color("BorderColor").opacity(0.4)
                
                Rectangle()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .blendMode(.color)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("BorderColor"), lineWidth: 1))
                    .padding(.horizontal)
            }
            .sheet(isPresented: $viewModel.isSheetPresented) {
                ValidateIbanSheet(
                    iban: $viewModel.scannedIban,
                    isSheetPresented: $viewModel.isSheetPresented
                )
                .onDisappear {
                    viewModel.resetScanner()
                    if !viewModel.scannedIban.isEmpty {
                        isScannerPresented = false
                        iban = viewModel.scannedIban
                    }
                }
                .presentationDetents([.medium])
            }
            .navigationTitle("Scanner votre IBAN")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    IbanScannerView(
        isScannerPresented: .constant(true),
        iban: .constant("FR7457574328547567868")
    )
}
