//
//  ColorButton.swift
//  StyleSphere
//
//  Created by MacBook Pro on 03/06/24.
//

import SwiftUI

struct ColorButton: View {
    @Binding var selection: String
    var color: String
    
    var isSelected: Bool {
        color == selection
    }
    
    var body: some View {
        
        Button(action: {
            if isSelected {
                selection = ""
            } else {
                selection = color
            }
        }) {
            HStack(spacing: 5) {
                if isSelected {
                    Image(systemName: "checkmark")
                }
                Text(color)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(isSelected ? Color.subColor2 : Color.mainColor)
            .foregroundColor(isSelected ? Color.white : Color.subColor)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Color.subColor, lineWidth: 1)
            )
        }
    }
}

#Preview {
    ColorButton(selection: .constant("Black"), color: "Black")
}
