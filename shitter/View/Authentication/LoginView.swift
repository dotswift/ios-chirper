import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image("shilling")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.top, 100)
                
                VStack{
                    CustomTextField(text: $email, placeholder: Text("hvfootball20@hotmail.com"))
                        .padding() // this padding spreads text field dimensions
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(200)
                        .padding() // this adds padding around the edges of the box
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $password, placeholder: Text("Password"))
                        .padding() // this padding spreads text field dimensions
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(200)
                        .padding() // this adds padding around the edges of the box
                        .foregroundColor(.white)
                    
                }
                Spacer()
                
            }
        }
        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
