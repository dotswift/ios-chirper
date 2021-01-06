import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 12){ // spacing creates room between picture and username/text
                
                Image("shilling")
                    .resizable() // default image in Swift UI gets actual image size. This fixes that.
                    .scaledToFit()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) { // leading = left
                    HStack {
                        Text("Brenden")
                            .font(.system(size: 14, weight : .semibold))
                        Text("@letsgohoover07 •")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight : .bold))
                        Text("Yesterday")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight : .bold))
                    }
                    
                    Text("Anyone want to play PS2?")
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
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
            Divider() // divider line under cell automatically rendered
        }
        .padding(.leading, -16)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
