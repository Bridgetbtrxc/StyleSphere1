import SwiftUI


@main
struct StyleSphereMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [WardrobeItem.self, LooksItem.self])
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            DetailView()
        }
    }
}

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: Home()) {
                Label("Home", systemImage: "house")
            }
            NavigationLink(destination: DetailView(text: "Wardrobe")) {
                Label("Wardrobe", systemImage: "star")
            }
            NavigationLink(destination: DetailView(text: "Looks")) {
                Label("Looks", systemImage: "star")
            }
            NavigationLink(destination: DetailView(text: "Calendar")) {
                Label("Calendar", systemImage: "star")
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 150, idealWidth: 200, maxWidth: 300, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: toggleSidebar) {
                    Label("Toggle Sidebar", systemImage: "sidebar.left")
                }
            }
        }
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct DetailView: View {
    var text: String = "Welcome"
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
