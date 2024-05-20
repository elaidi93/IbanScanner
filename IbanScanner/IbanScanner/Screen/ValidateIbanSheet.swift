//
//  ValidateIbanSheet.swift
//  IbanScanner
//
//  Created by Hamza EL Aidi on 19/05/2024.
//

import SwiftUI

struct ValidateIbanSheet: View {
    
    @Binding var iban: String
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Text("L'IBAN du bénéficiaire a été scanné")
                .bold()
                .foregroundStyle(.white)
            
            VStack(spacing: 10) {
                Text("Penser à le vérifier avant de valider")
                    .foregroundStyle(.white)
                
                Text(iban)
                    .bold()
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                Button(action: {
                    isSheetPresented = false
                }) {
                    Text("Valider")
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .tint(.white)
                .background(Color("BorderColor"))
                .cornerRadius(25)
                
                Button(action: {
                    isSheetPresented = false
                    iban = ""
                }) {
                    Text("Recommancer")
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color("BorderColor"))
                )
                .tint(Color("BorderColor"))
            }
        }
        .padding()
        .background(Color("TextFieldBackground"))
    }
}

#Preview {
    ValidateIbanSheet(
        iban: .constant("FR7611315000011234567890138"),
        isSheetPresented: .constant(true)
    )
}
