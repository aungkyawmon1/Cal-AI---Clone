//
//  GoalSelectionView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct GoalSelectionView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let goals = ["lose_weight".localized , "maintain".localized , "gain_weight".localized]
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("what_is_your_goal".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("what_is_your_goal_description".localized)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                    
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                ForEach(Array(goals.enumerated()), id: \.element) { index, goal in
                    SelectableTextButton(
                        text: goal,
                        isSelected: userData.goal == goal,
                        action: {
                            userData.goal = goal
                        }
                    )
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
    GoalSelectionView(userData: UserData())
}
