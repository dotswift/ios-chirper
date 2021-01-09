import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    
    var body: some View {
        
        if isCurrentUser{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color(.blue))
                    .foregroundColor(.white)
            })
            .cornerRadius(20) // divide the height by 2 to get the rounded edges (40/2)
            
        } else {
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .frame(width: 180, height: 40)
                        .background(Color(.yellow))
                        .foregroundColor(.black)
                })
                .cornerRadius(20) // divide the height by 2 to get the rounded edges (40/2)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color(.brown))
                        .foregroundColor(.white)
                })
                .cornerRadius(20) // divide the height by 2 to get the rounded edges (40/2)
                
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isCurrentUser: false)
    }
}
