//
//  Header.swift
//  StyleSphereMac
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bridget Beatrix Claire")
                .font(.title3)
                .fontWeight(.bold)
            Text("Choose Your Style")
                .font(.body)
            Text("Style That Matches You 🔥")
                .font(.headline)
            Spacer()
            Image("dots")
                .padding(12)
                .background(Color(NSColor.windowBackgroundColor)) // macOS specific color
                .cornerRadius(32)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
