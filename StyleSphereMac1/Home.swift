//
//  Home.swift
//  StyleSphereMac1
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct Home: View {
    var text: String
    
    var body: some View {
      Header()
    
        
    }
}

extension Color {
    init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(
            red: red, green: green, blue: blue
        )
        
    }
}


//extension Color {
//    static let mainColor = Color(hex: 0xDECEBF)
//    static let subColor = Color(hex: 0x6C5038)
//    static let subColor2 = Color(hex: 0xA68069)
//    static let neutral = Color(hex: 0xD7D7D7)
//}
//
//extension Color {
//    init(hex: UInt, opacity: Double = 1) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xff) / 255,
//            green: Double((hex >> 8) & 0xff) / 255,
//            blue: Double(hex & 0xff) / 255,
//            opacity: opacity
//        )
//    }
//}

#Preview {
    Home(text: "hello")
}
