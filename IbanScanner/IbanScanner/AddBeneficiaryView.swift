//
//  AddBeneficiaryView.swift
//  IbanScanner
//
//  Created by Hamza EL Aidi on 18/05/2024.
//

import SwiftUI

struct AddBeneficiaryView: View {
    
    @State private var ibanInput: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Ajouter un bénéficiaire")
                .font(.title)
                .foregroundStyle(.white)
            
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
        }
        .padding()
        .background(.black)
    }
}

#Preview {
    AddBeneficiaryView()
}
