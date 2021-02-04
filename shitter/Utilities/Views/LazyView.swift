import SwiftUI

struct LazyView<Content: View>: View{
    // Only going to load content when it is a part of the view on screen
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content{
        build()
    }
}
