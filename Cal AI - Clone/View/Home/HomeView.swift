//
//  HomeView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct HomeView: View {
    let userData: UserData
    @State private var isAnimating = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Welcome Header
                welcomeHeader
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -50)
                
                // User Data Table
                VStack(spacing: 15) {
                    ForEach(userDataRows, id: \.title) { row in
                        DataRow(title: row.title, value: row.value)
                            .opacity(isAnimating ? 1 : 0)
                            .offset(x: isAnimating ? 0 : -100)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color.black.opacity(0.1), radius: 10)
                )
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                isAnimating = true
            }
        }
    }
    
    private var welcomeHeader: some View {
        VStack(spacing: 10) {
            Text("Welcome to Cal AI")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your Personal Health Journey Begins")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
    private var userDataRows: [(title: String, value: String)] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        let heightString: String
        let weightString: String
        
        if userData.useMetricSystem {
            heightString = "\(userData.height.cm) cm"
            weightString = "\(userData.weight.kg) kg"
        } else {
            heightString = "\(userData.height.feet)'\(userData.height.inches)\""
            weightString = "\(userData.weight.lb) lbs"
        }
        
        return [
            ("Gender", userData.gender),
            ("Workouts per Week", "\(userData.workoutsPerWeek)"),
            ("Found Through", userData.socialSource),
            ("Previous App Experience", userData.hasTriedOtherApps == true ? "Yes" : "No"),
            ("Measurement System", userData.useMetricSystem ? "Metric" : "Imperial"),
            ("Height", heightString),
            ("Weight", weightString),
            ("Birth Date", dateFormatter.string(from: userData.birthDate))
        ]
    }
}

#Preview {
    let sampleData = UserData()
    HomeView(userData: sampleData)
}
