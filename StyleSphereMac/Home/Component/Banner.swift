//
//  Banner.swift
//  StyleSphereMac
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.93, green: 0.90, blue: 0.85))
                .cornerRadius(20)
                .frame(height: 170)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Want to find out clothes?")
                    .font(Font.custom("Inter", size: 20).weight(.heavy))
                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                
                Text("Take a Photo & Scan it Now!")
                    .font(Font.custom("Inter", size: 14))
                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                
                Button(action: {
                    // info
                    print("Import Now button tapped")
                }) {
                    HStack(spacing: 0) {
                        Text("Import Now")
                            .font(Font.custom("Inter", size: 14).weight(.medium))
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .frame(width: 278)
                    .background(Color(red: 0.42, green: 0.31, blue: 0.22))
                    .cornerRadius(20)
                }
            }
        }
    }
}
