import SwiftUI
import Foundation
import ParseSwift

struct HomeView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(
                    colors: [.blue.opacity(0.2), .green.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 25) {

                    Image(systemName: "figure.strengthtraining.traditional")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                        .padding(.top, 30)

                    Text("FitnessTracker")
                        .font(.largeTitle.bold())

                    Text("Track workouts & generate meals in a single place")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Spacer()

                    VStack(spacing: 16) {

                        NavigationLink(destination: WorkoutLogView()) {
                            IndividualTabs(
                                title: "Exercise Logging",
                                subtitle: "Track your workouts",
                                icon: "dumbbell.fill",
                                color: .blue
                            )
                        }

                        NavigationLink(destination: MealPlanGeneratorView()) {
                            IndividualTabs(
                                title: "Meal Planner",
                                subtitle: "Generate meal plans",
                                icon: "fork.knife",
                                color: .green
                            )
                        }
                        
                        NavigationLink(destination: WorkoutHistoryView()) {
                            IndividualTabs(
                                title: "Exercise Log History",
                                subtitle: "View Past Exercise Logs",
                                icon: "clock.arrow.circlepath",
                                color: .red
                            )
                        }
                        
                        NavigationLink(destination: UpdateLogView()) {
                            IndividualTabs(
                                title: "Update Log",
                                subtitle: "View App Update History",
                                icon: "note.text",
                                color: .purple
                            )
                        }
                    }
                    .padding(.horizontal, 25)

                    Spacer()

                    Button(action: logout) {
                        Text("Sign Out")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding(.bottom, 30)
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }

    func logout() {
        User.logout { result in
            switch result {
            case .success:
                isLoggedIn = false
            case .failure(let error):
                print("Error logging out: \(error.localizedDescription)")
            }
        }
    }
}





#Preview {
    HomeView(isLoggedIn: .constant(true))
}
