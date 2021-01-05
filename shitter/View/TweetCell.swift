import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 12){ // spacing creates room between picture and username/text
                
                Image("batman")
                    .resizable() // default image in Swift UI gets actual image size. This fixes that.
                    .scaledToFit()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) { // leading = left
                    HStack {
                        Text("Bobby Lolli Jr.")
                            .font(.system(size: 14, weight : .semibold))
                        Text("@bobbylolli •")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight : .bold))
                        Text("Dec '98")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight : .bold))
                    }
                    
                    Text("We need to book more banquets to save the restaurant.")
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
