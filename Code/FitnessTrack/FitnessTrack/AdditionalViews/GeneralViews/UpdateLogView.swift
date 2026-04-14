import SwiftUI

struct UpdateLogView: View {
    var body: some View {
        
        VStack(spacing: 16) {
            Text("Update Log")
                .font(.largeTitle.bold())
                .padding(.top)
            IndividualTabs(
                title: "Version 5.0",
                subtitle: "Updated and polished code to better handle data.",
                icon: "externaldrive",
                color: .blue
            )
            IndividualTabs(
                title: "Version 4.0",
                subtitle: "Complete UI overhaul and update.",
                icon: "arrow.clockwise",
                color: .green
            )
            IndividualTabs(
                title: "Version 3.0",
                subtitle: "Fixed and polished some bugs/errors.",
                icon: "exclamationmark.triangle",
                color: .yellow
            )
            
            IndividualTabs(
                title: "Version 2.0",
                subtitle: "Addition of meal plan generation using Spoonacular API.",
                icon: "fork.knife",
                color: .orange
            )
            
            IndividualTabs(
                title: "Version 1.0",
                subtitle: "Functionality for exercise logging/editing/deleting added.",
                icon: "dumbbell.fill",
                color: .red
            )
            
        }
        .navigationTitle("Update Log")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    UpdateLogView()
}
