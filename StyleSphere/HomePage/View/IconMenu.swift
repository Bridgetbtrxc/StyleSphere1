//
//  IconMenu.swift
//  StyleSphere
//
//  Created by MacBook Pro on 22/05/24.
//
//  IconMenu.swift
//  StyleSphere
//
//  Created by MacBook Pro on 22/05/24.
//
import SwiftUI

struct IconMenu: View {
    var body: some View {
        Button(action: {
            // add here
            print("IconMenu button tapped")
        }) {
            HStack(spacing: 8) {
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 28, height: 22)
                    .overlay(
                        Image("dots")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 14)
                            .foregroundColor(.blue)
                    )
            }
            .padding(12)
            .background(Color(red: 0.93, green: 0.90, blue: 0.85))
            .cornerRadius(32)
            .frame(width: 50, height: 48)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    IconMenu()
}

