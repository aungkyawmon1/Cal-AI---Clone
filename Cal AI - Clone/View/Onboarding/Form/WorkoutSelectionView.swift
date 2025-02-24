//
//  WorkoutSelectionView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct WorkoutSelectionView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let workoutSelections = [
        WorkoutSectionVO(name: "0-2", caption: "Workouts now and then", icon: "circle.fill"),
        WorkoutSectionVO(name: "3-5", caption: "A few workouts per week", icon: "xmark.triangle.circle.square.fill"),
        WorkoutSectionVO(name: "6+", caption: "Dedicated athlete", icon: "ellipsis")
    ] // (Title, Caption, system image)
    
    var body: some View {
        VStack(alignment: .leading) {
        
            VStack(alignment: .leading, spacing: 8.0) {
                Text("how_many_workouts_do_you_do_per_week".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("description".localized)
                    .font(.body)
                    .foregroundColor(.gray)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }

            Spacer()

            VStack(spacing: 20) {
                ForEach(Array(workoutSelections.enumerated()), id: \.element) { index, workoutSelection in
                    WorkoutSelectionButtonWithIcon(
                        icon: workoutSelection.icon,
                        text: workoutSelection.name,
                        caption: workoutSelection.caption,
                        isSelected: userData.workoutsPerWeek == workoutSelection.name,
                        isSystemImage: true
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            userData.workoutsPerWeek = workoutSelection.name
                        }
                    }
                    .modifier(SlideInFromTopModifier(
                        isPresented: isViewVisible,
                        delay: 0.3 + Double(index) * 0.1
                    ))
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .onAppear {
            // Trigger animations
            isViewVisible = true
            
        }
        .onDisappear {
            // Reset states
            isViewVisible = false
        }
    }
}

#Preview {
    WorkoutSelectionView(userData: UserData())
}
