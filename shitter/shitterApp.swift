import SwiftUI
import  Firebase

// Everything is routed through here instead of App / Scene Delegate
@main
struct shitterApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
        }
    }
}
