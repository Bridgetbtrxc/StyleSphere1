//
//  ContentView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboardingOpen") private var onboardingOpen = true

    @State var showSplashScreen = true
    var body: some View {
        if showSplashScreen {
            SplashScreenView1().onAppear {
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 2
                ) {
                    withAnimation {
                        showSplashScreen = false
                    }
                }
            }
        } else {
            NavigationStack {
                Navigation()
                
            }.fullScreenCover(isPresented: $onboardingOpen){
                SplashScreenView()
            }
        }
    }
}

#Preview {
    ContentView()
}
