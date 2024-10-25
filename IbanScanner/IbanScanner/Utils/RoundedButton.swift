//
//  RoundedButton.swift
//  IbanScanner
//
//  Created by hamza el aidi on 24/10/2024.
//

import SwiftUI

struct RoundedButton: View {
    let title: String?
    var image: Image? = nil
    let action: () -> Void
    var backgroundColor: Color = .clear
    var borderColor: Color? = nil
    var textColor: Color = .white
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let image {
                    image
                        .imageScale(.large)
                }
                if let title {
                    Text(title)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
        }
        .background(backgroundColor)
        .foregroundColor(textColor)
        .cornerRadius(25)
        .overlay(
            borderColor != nil ?
            RoundedRectangle(cornerRadius: 25)
                .stroke(borderColor ?? .clear)
            : nil
        )
    }
}
