import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, password: String, userName: String,  fullName: String, userImage: UIImage){
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if  let error  = error  {
                print("[Error] registerUser() error = \(error.localizedDescription)")
                return
            }
            print("[Success] registerUser() email=\(email)")
        }
    }
}
