import SwiftUI
import Foundation
import ParseSwift

@main
struct FitnessTrackApp: App {
    init () {
        
        var configuration = ParseConfiguration(
            applicationId: "0kLOJWaEeKAUoIp9R855YCmniXOdoiRkFGLx81lj",
            clientKey: "LeShc4ZXDV0FG2UCijfBSLQ82pbrfzg6Pa9zhXiS",
            serverURL: URL(string:"https://parseapi.back4app.com")!
        )
        
        
        ParseSwift.initialize(configuration: configuration)
        
        if let currentUser = User.current {
            print("Current user logged in: \(currentUser.username ?? "Unknown")")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
