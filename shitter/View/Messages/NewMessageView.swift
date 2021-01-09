import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool

    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText )
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10){ _ in
                    // horizontal spacer "shorthand" for left hand alignment (space on right)
                    HStack { Spacer() }
                    
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                    }, label: {
                          UserCell()
                    })
                }
            }.padding(.leading)
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
