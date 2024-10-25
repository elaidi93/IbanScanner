//
//  ValidateIbanSheet.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//


import SwiftUI

struct ValidateIbanSheet: View {
    
    @Binding var iban: String
    @Binding var isSheetPresented: Bool
    @Binding var contentHeight: CGFloat
    
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
            
            VStack(spacing: 20) {
                
                RoundedButton(
                    title: "Valider",
                    action: {
                        isSheetPresented = false
                    },
                    backgroundColor: Color("BorderColor"),
                    textColor: .white
                )
                
                RoundedButton(
                    title: "Recommencer",
                    action: {
                        isSheetPresented = false
                        iban = ""
                    },
                    backgroundColor: .clear,
                    borderColor: Color("BorderColor"),
                    textColor: Color("BorderColor")
                )
            }
        }
        .padding()
        .background(Color("TextFieldBackground"))
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        contentHeight = geometry.size.height
                    }
            }
        )
    }
}

#Preview {
    ValidateIbanSheet(
        iban: .constant("FR7611315000011234567890138"),
        isSheetPresented: .constant(true),
        contentHeight: .constant(200)
    )
}
