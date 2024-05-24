//
//  SplashScreenView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI

struct SplashScreenView1: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.mainColor)
                .ignoresSafeArea()
            Image("logo")
        }
    }
}

#Preview {
    SplashScreenView1()
}
