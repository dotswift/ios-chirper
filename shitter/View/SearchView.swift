import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText )
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10){ _ in
                    // horizontal spacer "shorthand" for left hand alignment (space on right)
                    HStack { Spacer() }
                    
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell()
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
