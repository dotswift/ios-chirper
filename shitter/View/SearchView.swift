import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    // viewmodel is observable (SearchViewModel) and the object being observed is the viewModel, hence @ObservedObject
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText )
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users){ user in
                    // horizontal spacer "shorthand" for left hand alignment (space on right)
                    HStack { Spacer() }
                    
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell(user: user)
                        })
                    
                    
                }
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
