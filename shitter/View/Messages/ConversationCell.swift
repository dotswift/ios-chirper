import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12){
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                VStack(alignment: .leading, spacing: 4){
                    Text("Robert Lolli, Jr")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("The restaurant is in dire straits, we need help.")
                        .font(.system(size: 15))
                        .lineLimit(2)
                }.padding(.trailing) // trailing (opposite of leading)
            }
            Divider()
        }

    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
