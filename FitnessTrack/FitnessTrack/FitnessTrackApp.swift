import SwiftUI
import Foundation
import ParseSwift

@main
struct FitnessTrackApp: App {
    init () {
        
        var configuration = ParseConfiguration(
            applicationId: "INSERT APP ID HERE",
            clientKey: "INSERT CLIENT KEY HERE",
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
