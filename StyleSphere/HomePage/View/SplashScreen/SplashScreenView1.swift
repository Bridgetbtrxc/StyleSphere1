//
//  SplashScreenView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI

struct SplashScreenView1: View {
    @State var showLogo = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.mainColor)
                .ignoresSafeArea()
            Image("logo")
                .resizable()
                .frame(
                    width: showLogo ? 150 : 0,
                    height: showLogo ? 150 : 0
                )
        }.onAppear {
            withAnimation {
                showLogo = true
            }
        }
    }
}

#Preview {
    SplashScreenView1()
}
