import SwiftUI

// Every time you create a SwiftUI file, you get a preview struct associated with it so you can see changes happening in real time.
struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            TabView {
                
                FeedView()
                    .tabItem {
                        Image(systemName:"house")
                        Text("Shilling's House")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName:"magnifyingglass")
                        Text("Find Loan")
                    }
                Text("Message")
                    .tabItem {
                        Image(systemName:"envelope")
                        Text("Forclose Restaurant")
                    }
            }
            .navigationBarTitle("Fuck")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
