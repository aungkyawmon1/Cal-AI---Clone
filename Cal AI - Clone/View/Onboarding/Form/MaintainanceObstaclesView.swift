//
//  MaintainanceObstaclesView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct MaintainanceObstaclesView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let obstacles = [
        SelectableTextButtonWithIconVO(name: "lack_of_consistency".localized, icon: "chart.bar.fill"),
        SelectableTextButtonWithIconVO(name: "unhealthy_eating_habits".localized, icon: "birthday.cake.fill"),
        SelectableTextButtonWithIconVO(name: "lack_of_support".localized, icon: "hands.clap.fill"),
        SelectableTextButtonWithIconVO(name: "busy_schedule".localized, icon: "calendar"),
        SelectableTextButtonWithIconVO(name: "lack_of_meal_inspiration".localized, icon: "ear.fill"),
    ] // (Title, image resource)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("maintainance_obstacles_view_title".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            VStack(spacing: 12) {
                ForEach(Array(obstacles.enumerated()), id: \.element) { index, obstacle in
                    
                    SelectableTextButtonWithIcon(
                        icon: obstacle.icon,
                        text: obstacle.name,
                        isSelected: userData.maintainanceObstacle == obstacle.name,
                        isSystemImage: true
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            userData.maintainanceObstacle = obstacle.name
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
    MaintainanceObstaclesView(userData: UserData())
}
