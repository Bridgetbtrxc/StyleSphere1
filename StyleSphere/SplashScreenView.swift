//
//  SplashScreenView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    @AppStorage("onboardingOpen") private var onboardingOpen = true
    @State var splashIndex = 0
    
    let items: [SplashScreenItem] = [
        .init(mainImage: "Splash1_1", title: "Fashion Fun and Effortless", subtitle: "Discover your style, streamline your wardrobe, and unlock endless outfit possibilities with Clothing Pairing App"),
        .init(mainImage: "Splash2_2", title: "Digitize Your Wardrobe", subtitle: "Begin by adding your clothing items to your digital closet. Paste pictures or import from your gallery, and let the magic begin!"),
        .init(mainImage: "Splash3_3", title: "Plan Your Outfit", subtitle: "Define and plan your outfit for event or for travelling with our baggage and calendar feature"),
        .init(mainImage: "Splash4_4", title: "Copy - Paste", subtitle: "We utilize Iphone’s ability to auto-cut image Directly Copy > Paste to our app")
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.mainColor)
                .ignoresSafeArea()
            Image("Splash1")
                .resizable()
            
            VStack {
                Spacer()
                Image(items[splashIndex].mainImage)
                Spacer()
                
                VStack(spacing: 10) {
                    HStack {
                        ForEach(Array(items.enumerated()), id: \.element) { index, item in
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.mainColor)
                                .frame(width: splashIndex == index ? 30 : 10, height: 10)
                                .foregroundStyle(
                                    splashIndex == index ? Color.gray : Color.mainColor
                                )
                                
                        }
                    }

                    Text(items[splashIndex].title)
                        .font(.title2)
                        .bold()
                        .padding(.vertical, 20)
                        .foregroundStyle(Color.subColor)
                    Text(items[splashIndex].subtitle)
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .padding(.bottom, 30)
                        .foregroundStyle(Color.subColor)
                    
                    Button("Continue") {
                        withAnimation(.snappy) {
                            if splashIndex == (items.count - 1) {
                                onboardingOpen = false
                            } else {
                                splashIndex += 1
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.subColor)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity)
                .background(.white)
                
            }.frame(maxWidth: .infinity)
        }
    }
    
}

#Preview {
    SplashScreenView()
}
