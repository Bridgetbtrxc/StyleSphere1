//
//  Header.swift
//  StyleSphereMac1
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Bridget Beatrix Claire")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Choose Your Style")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 8) {
                    // Placeholder content
                    Image("dots")
                }
                .padding(12)
                .background(Color(hex: 0xDECEBF))
                .cornerRadius(32)
                
            }
            .padding(20)
            
            Text("Style That Matches You🔥")
                .font(
                    Font.custom("Inter", size: 16)
                        .weight(.bold)
                )
                .foregroundColor(Color(hex: 0xDECEBF))
            
            StyleInfoView().frame(height:200)
            Spacer()
                .frame(width:20)
            Banner()
            Spacer()
                .frame(width:20)
            YourWardrobe()
        }.frame(width: 500, height: 500).padding()
        
        // Large/Bold
        
        
        
    }
    
    
}
