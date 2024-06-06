//
//  IconMenu.swift
//  StyleSphereMac
//
//  Created by MacBook Pro on 07/06/24.
//
import SwiftUI

struct IconMenu: View {
    var body: some View {
        Button(action: {
            // Action for the button
            print("IconMenu button tapped")
        }) {
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(10)
        .background(Color(nsColor: .windowBackgroundColor))
        .cornerRadius(20)
        .shadow(radius: 3)
    }
}
