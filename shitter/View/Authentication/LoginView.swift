import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
        ZStack {
          
            VStack {
                Image("shilling")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.top, 100)
                    .padding(.bottom, 32)
                
                VStack(spacing: 20){
                    CustomTextField(text: $email, placeholder: Text("email"), imageName: "envelope")
                        .padding() // this padding spreads text field dimensions
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(200)
                        .padding() // this adds padding around the edges of the box
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("password"), imageName: "lock")
                        .padding() // this padding spreads text field dimensions
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(200)
                        .padding(.horizontal) // this adds padding around the edges of the box
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal, 32)
                
                HStack{ // move to right
                    
                    Spacer()
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                            .padding(.trailing, 32)
                        
                        
                    })
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.yellow)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView().navigationBarBackButtonHidden(true),
                    label: {
                        HStack {
                            Text("Need to save your restaurant?")
                                
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text("Sign up here!")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                        
                    })
            }
            .background(Color(.brown))
        }
        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
        .ignoresSafeArea()
    }
}
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
