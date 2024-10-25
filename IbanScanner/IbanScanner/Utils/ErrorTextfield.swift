//
//  ErrorTextfield.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//

import SwiftUI

struct ErrorTextfield: View {
    let placeholder: String
    @Binding var text: String
    var isValid: Bool
    let errorMessage: String
    
    var showError: Bool { !isValid && !text.isEmpty }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack {
                TextField(
                    placeholder,
                    text: $text
                )
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                
                Spacer()
                
                Divider()
                    .overlay(!showError ? .white : .red)
            }
            .frame(height: 30)
            .padding()
            .background(Color("TextFieldBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke( !showError ? .clear : .red, lineWidth: 1)
            )
            
            if showError {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 4)
            }
        }
    }
}
