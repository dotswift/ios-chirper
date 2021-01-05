import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                // TODO: LazyVStack only load cells on an as-needed basis "lazy"
                VStack{
                    ForEach(0..<20){ _ in
                        ConversationCell()
                        
                    }
                }.padding()
            }
            
            Button(action: {}, label: {
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
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
