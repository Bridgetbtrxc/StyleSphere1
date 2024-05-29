//
//  AddClothes.swift
//  StyleSphere
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct AddClothes: View {
    @State private var clothesTitle = ""
    @State private var selectedCategory = 0
    @State private var selectedColor = 0
    
    let categories = ["Shirts", "Pants", "Shoes"] // Dummy data sementara
    let colors = ["Red", "Green", "Blue"] // Dummy data
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                Button(action: {
                    print("Back button pressed")
                }) {
                    Image("Back")
                }
                Spacer()
                Text("Add to Wardrobe")
                    .font(Font.custom("Inter", size: 18).weight(.medium))
                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                Spacer()
            }
            .padding()
            
            Text("Add New Clothes")
                .font(Font.custom("Inter", size: 20).weight(.heavy))
                .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Clothes Name")
                    .font(Font.custom("Inter", size: 16).weight(.heavy))
                    .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                    .padding(.leading)
                
                TextField("Add Title", text: $clothesTitle)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 0.93, green: 0.90, blue: 0.85), lineWidth: 1)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 0.93, green: 0.90, blue: 0.85))
                            )
                    )
                    .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Category")
                            .font(Font.custom("Inter", size: 16).weight(.heavy))
                            .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                            .padding(.leading)
                        
                        Picker(selection: $selectedCategory, label: Text("")) {
                            ForEach(0..<categories.count) { index in
                                Text(categories[index]).tag(index)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 120, height: 50)
                        .background(Color(red: 0.93, green: 0.90, blue: 0.85))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Color")
                            .font(Font.custom("Inter", size: 16).weight(.heavy))
                            .foregroundColor(Color(red: 0.42, green: 0.31, blue: 0.22))
                            .padding(.leading)
                        
                        Picker(selection: $selectedColor, label: Text("")) {
                            ForEach(0..<colors.count) { index in
                                Text(colors[index]).tag(index)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 120, height: 50)
                        .background(Color(red: 0.93, green: 0.90, blue: 0.85))
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    AddClothes()
}
