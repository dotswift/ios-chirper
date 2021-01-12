import SwiftUI

// Every time you create a SwiftUI file, you get a preview struct associated with it so you can see changes happening in real time.
struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                // shows if user is logged in
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
                        ConversationsView()
                            .tabItem {
                                Image(systemName:"envelope")
                                Text("Forclose Restaurant")
                            }
                    }
                    .navigationBarTitle("Shitter")
                    .navigationBarTitleDisplayMode(.inline)
                }
                
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
