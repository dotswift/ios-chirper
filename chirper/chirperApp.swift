import SwiftUI
import  Firebase

// Everything is routed through here instead of App / Scene Delegate
@main
struct chirperApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
