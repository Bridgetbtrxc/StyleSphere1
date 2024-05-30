import SwiftUI

struct Navigation: View {
    @State private var visualSelectedIndex = 0
    @State private var programmaticSelectedIndex = 0
    @State private var hasAnot = false
    
    
    var body: some View {
        TabView(selection: $programmaticSelectedIndex) {
            HomeView1().tabItem {
                Image(visualSelectedIndex == 0 ? "HomePressed" : "Home")
                Text("Home")
            }.tag(0)
                .onAppear { self.visualSelectedIndex = 0 }
            
            WardrobeView().tabItem {
                Image(visualSelectedIndex == 1 ? "Wardrobe" : "WardrobePressed")
                Text("Wardrobe")
            }.tag(1)
                .onAppear { self.visualSelectedIndex = 1 }
            
            CalendarView().tabItem {
                Image(visualSelectedIndex == 2 ? "CalendarPressed" : "Calendar")
                Text("Calendar")
            }.tag(2)
                .onAppear { self.visualSelectedIndex = 2}
            
            LooksView().tabItem {
                Image(visualSelectedIndex == 3 ? "LooksPressed" : "Looks")
                Text("Looks")
            }.tag(3)
                .onAppear { self.visualSelectedIndex = 3}
            
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var wardrobeViewModel = WardrobeViewModel()
        
        Navigation()
            .environmentObject(wardrobeViewModel)
            
    }
}
