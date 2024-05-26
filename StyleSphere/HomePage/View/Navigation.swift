//  HomeView.swift
//  StyleSphere
//
//  Created by MacBook Pro on 22/05/24.
//

import SwiftUI

struct Navigation: View {
    @State var isHovered = false
    var body: some View {
        
        @State var selection = 0
            
        TabView(selection: $selection){
            HomeView1().tabItem {
                VStack {
                                        Image(selection == 0 ? "HomePressed" : "Home")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text("Home")
                                    }
            }.tag(0)
            
            WardrobeView().tabItem{
                VStack {
                                       Image(selection == 1 ? "WardrobePressed" : "Wardrobe")
                                           .resizable()
                                           .frame(width: 30, height: 30)
                                       Text("Wardrobe")
                                   }
            }.tag(1)
            
            CalendarView().tabItem{
                VStack {
                                       Image(selection == 1 ? "WardrobePressed" : "Wardrobe")
                                           .resizable()
                                           .frame(width: 30, height: 30)
                                       Text("Wardrobe")
                                   }
            }.tag(2)
            
            LooksView().tabItem{
                VStack {
                                       Image(selection == 1 ? "WardrobePressed" : "Wardrobe")
                                           .resizable()
                                           .frame(width: 30, height: 30)
                                       Text("Wardrobe")
                                   }
            }.tag(3)
            
            
            
           
            }
            
            
            
        }
        
            
          
        
    }
    


struct TabItemButton: View {
    let label: String
    @State private var isHovered = false
    
    var body: some View {
        VStack {
            Image(isHovered ? "HomePressed" : "Home")
                .resizable()
                .frame(width: 30, height: 30) // Adjust size as needed
            
            Text(label)
                .foregroundColor(isHovered ? .red : .blue)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(isHovered ? Color.yellow : Color.clear)
        .cornerRadius(8)
        .onHover { hovered in
            self.isHovered = hovered
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

