import SwiftUI

struct TweetActionsView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
        }
        .padding(.horizontal)
        .foregroundColor(.pink)
    }
}

struct TweetActionsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetActionsView()
    }
}
