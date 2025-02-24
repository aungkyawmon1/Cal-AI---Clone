//
//  WorkoutSelectionView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct WorkoutSelectionView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            Text("How many workouts do you do per week?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()

            ForEach(0..<8) { count in
                Button(action: {
                    userData.workoutsPerWeek = count
                }) {
                    HStack {
                        Text("\(count) \(count == 1 ? "Workout" : "Workouts")")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        if userData.workoutsPerWeek == count {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            }

            Spacer()
        }
    }
}

#Preview {
    WorkoutSelectionView(userData: UserData())
}
