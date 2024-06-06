//
//  Header.swift
//  StyleSphereMac
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Text("Beatrix")
                .font(.system(size: 24, weight: .bold))
                .padding(.leading, 20)
            
            Text("Choose your style")
                .font(.system(size: 18))
                .padding(.leading, 5)
            
            Spacer()
            
            IconMenu()
                .padding(.trailing, 20)
        }
        .frame(height: 50)
        .background(Color(nsColor: .windowFrameColor))
        .cornerRadius(10)
    }
}
