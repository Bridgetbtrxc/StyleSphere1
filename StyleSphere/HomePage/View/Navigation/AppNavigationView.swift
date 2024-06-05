import SwiftUI

struct AppNavigationView: View {
    @State private var visualSelectedIndex = 0
    @State private var programmaticSelectedIndex = 0
    @State private var hasAnot = false
    @State private var currentDate = Date()
    
    
    
    var iPadNavigation: some View {
        NavigationSplitView(sidebar: {
            List {
                NavigationLink(destination: HomeView1().frame(maxWidth: 600)
                ) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: WardrobeView()) {
                    Label("Wardrobe", systemImage: "person")
                }
                NavigationLink(destination: CalendarView(currentDate: $currentDate)) {
                    Label("Calendar", systemImage: "calendar")
                }
                NavigationLink(destination: LooksView()) {
                    Label("Looks", systemImage: "photo")
                }
            }
        }) {
            HomeView1().frame(maxWidth: 600)
        }
    }
    
    var iPhoneNavigation: some View {
        TabView(selection: $programmaticSelectedIndex) {
            HomeView1()
                .padding()
                .tabItem {
                Image(visualSelectedIndex == 0 ? "HomePressed" : "Home")
                Text("Home")
            }
            .tag(0)
            .onAppear { self.visualSelectedIndex = 0 }
            
            WardrobeView().tabItem {
                Image(visualSelectedIndex == 1 ? "Wardrobe" : "WardrobePressed")
                Text("Wardrobe")
            }
            .tag(1)
            .onAppear { self.visualSelectedIndex = 1 }
            
            CalendarView(currentDate: $currentDate).tabItem {
                Image(visualSelectedIndex == 2 ? "CalendarPressed" : "Calendar")
                Text("Calendar")
            }
            .tag(2)
            .onAppear { self.visualSelectedIndex = 2}
            
            LooksView().tabItem {
                Image(visualSelectedIndex == 3 ? "LooksPressed" : "Looks")
                Text("Looks")
            }
            .tag(3)
            .onAppear { self.visualSelectedIndex = 3}
        }
    }
    
    
    var body: some View {
        if UIDevice.isIPad {
            iPadNavigation
        } else {
            iPhoneNavigation
        }
    }
}



#Preview {
    struct PreviewContent: View {
        var body: some View {
            AppNavigationView()
                .modelContainer(SwiftDataModel.container)
        }
    }
    
    return PreviewContent()
}
