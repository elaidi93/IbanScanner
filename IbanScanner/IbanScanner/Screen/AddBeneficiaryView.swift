//
//  AddBeneficiaryView.swift
//  IbanScanner
//
//  Created by Hamza EL Aidi on 18/05/2024.
//

import SwiftUI

struct AddBeneficiaryView: View {
    
    @State private var ibanInput: String = ""
    @State private var isShowingDetailView = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                
                Text("Scannez, importez ou saisissez l'IBAN")
                    .lineLimit(0)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                
                VStack {
                    TextField(
                        "FR76 XXXX",
                        text: $ibanInput
                    )
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Divider()
                        .overlay(.white)
                }
                .frame(height: 30)
                .padding()
                .background(Color("TextFieldBackground"))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Spacer()
                
                Button(action: {
                    isShowingDetailView = true
                }) {
                    HStack {
                        Image(systemName: "camera.fill")
                            .imageScale(.large)
                        Text("Scanner")
                            .font(.headline)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("BorderColor"))
                )
                .tint(Color("BorderColor"))
                .sheet(isPresented: $isShowingDetailView) {
                    IbanScannerView(
                        isScannerPresented: $isShowingDetailView,
                        iban: $ibanInput
                    )
                }
            }
            .padding()
            .background(.black)
            .navigationTitle("Scanner votre IBAN")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddBeneficiaryView()
}
