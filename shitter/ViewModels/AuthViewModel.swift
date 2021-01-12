import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, password: String, userName: String,  fullName: String, userImage: UIImage){
        
        guard let imageData = userImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("[Error] registerUser() failed to upload image, error = \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return } // provides URL for the image
                
                // use the URL to upload the data to firebase
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if  let error = error  {
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "userName": userName,
                                "fullName": fullName,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data)
                    print("[Success] registerUser()")
                }
            }
        }
    }
}
