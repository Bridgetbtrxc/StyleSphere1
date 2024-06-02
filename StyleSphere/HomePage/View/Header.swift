//
//  Header.swift
//  StyleSphere
//
//  Created by MacBook Pro on 22/05/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            HStack(spacing: 1) {
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 10, height: 18)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Beatrix")
                        .font(Font.custom("Inter-Bold", size: 21).weight(.heavy))
                        .lineSpacing(26)
                        .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                    
                    Text("Choose your style")
                        .font(Font.custom("Inter", size: 12))
                        .lineSpacing(10)
                        .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                }
            }
            .frame(height: 48)
            Spacer()
            IconMenu()
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

