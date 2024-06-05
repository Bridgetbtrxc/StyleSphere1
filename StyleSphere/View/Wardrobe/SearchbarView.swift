//
//  SearchbarView.swift
//  StyleSphere
//
//  Created by Rama Adi Nugraha on 05/06/24.
//

import SwiftUI

struct SearchbarView: View {
    @Binding var text: String
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.subColor)
            TextField("Search your clothing", text: $text)
        }
        .padding(.all, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}

#Preview {
    SearchbarView(text: .constant(""))
}
