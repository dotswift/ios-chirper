import SwiftUI
// Everything is routed through here instead of App / Scene Delegate
@main
struct shitterApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()// login view shows up first
        }
    }
}
