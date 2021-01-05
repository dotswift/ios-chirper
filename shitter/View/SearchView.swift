import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText )
            
            VStack{
                ForEach(0..<19){ _ in
                    Text("add users here...")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
