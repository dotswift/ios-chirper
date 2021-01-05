import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                // TODO: LazyVStack only load cells on an as-needed basis "lazy"
                VStack{
                    ForEach(0..<20){ _ in
                        TweetCell()
                    }
                }.padding()
            }
            
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .resizable()
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
