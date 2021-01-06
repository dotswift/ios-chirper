import SwiftUI

struct ConversationsView: View {
    // any time this state variable changes SwiftUI (being reactive) will re-execute code when variable is changed
    // code can have a "dependency" on the $tate of this variable (see line 39)
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                // TODO: LazyVStack only load cells on an as-needed basis "lazy"
                VStack{
                    ForEach(0..<20){ _ in
                        NavigationLink(
                            destination: Text("Chat View"),
                            label: {
                                ConversationCell()
                            })
                        
                    }
                }.padding()
            }
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
                
            })
            .background(Color(.green))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            // when the isShowingNewMessageView variable is change this code is execuded again
            .sheet(isPresented: $isShowingNewMessageView, content: {
                SearchView()
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
