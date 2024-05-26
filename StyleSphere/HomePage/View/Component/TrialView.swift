import SwiftUI

struct TrialView: View {
    var body: some View {
        TabView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(1..<20) { index in
                        Text("Item \(index)")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("List")
            }
            
            Text("Second Tab Content")
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Grid")
                }
            
            Text("Third Tab Content")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrialView()
    }
}
