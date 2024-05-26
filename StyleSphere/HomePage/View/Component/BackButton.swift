//
//  BackButton.swift
//  StyleSphere
//
//  Created by MacBook Pro on 26/05/24.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.backward.circle.fill")
        }
        .symbolVariant(.circle.fill)
        .font(.title)
    }
}


