//
//  Color+Brand.swift
//  StyleSphere
//
//  Created by MacBook Pro on 23/05/24.
//

import Foundation
import SwiftUI

extension Color {
    static let mainColor = Color(hex: 0xDECEBF)
    static let subColor = Color(hex: 0x6C5038)
    static let subColor2 = Color(hex: 0xA68069)
    static let neutral = Color(hex: 0xD7D7D7)
}

extension Color {
    init(hex: UInt, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: opacity
        )
    }
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}

