import SwiftUI
import ParseSwift
import Foundation

struct ContentView: View {
    @State private var isLoggedIn = false
    var body: some View {
        Group {
            if isLoggedIn || User.current != nil {
                HomeView(isLoggedIn: $isLoggedIn)
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
        .onAppear {
            isLoggedIn = User.current != nil
        }
    }
}

#Preview {
    ContentView()
}
