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
                .foregroundColor(Color(nsColor: .windowBackgroundColor))
                .cornerRadius(20)
                .shadow(radius: 5)
                .frame(height: 200)

            VStack(alignment: .center, spacing: 10) {
                Text("Want to find out about new clothes?")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.primary)
                
                Text("Take a photo & scan it now!")
                    .font(.system(size: 18))
                    .foregroundColor(Color.primary)
                
                Button(action: {
                    // Implement the action
                    print("Import Now button tapped")
                }) {
                    Text("Import Now")
                        .font(.system(size: 16).weight(.medium))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
