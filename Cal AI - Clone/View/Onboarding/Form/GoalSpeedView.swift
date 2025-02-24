//
//  GoalSpeedView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct GoalSpeedView: View {
    @ObservedObject var userData: UserData
    @State private var weightLossSpeed: Double = 1.5 // Default value
    @State private var isViewVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("goal_speed_view_title".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("goal_speed_view_description".localized)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            // Speed Display and Controls
            VStack(spacing: 20) {
                Text("\(String(format: "%.1f", weightLossSpeed)) lbs per week")
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity) // Centers the text
                
                // Slider and Icons Container
                VStack(spacing: 10) {
                    HStack(spacing: 30) {
                        Spacer()
                            .frame(width: 0)
                        
                        Image(systemName: "tortoise.fill")
                            .foregroundColor(weightLossSpeed <= 1 ? .black : .gray)
                        
                        Spacer()
                        
                        Image(systemName: "hare.fill")
                            .foregroundColor(weightLossSpeed > 1 && weightLossSpeed <= 2 ? .black : .gray)
                        
                        Spacer()
                        
                        Image(systemName: "bolt.fill")
                            .foregroundColor(weightLossSpeed > 2 ? .black : .gray)
                        
                        Spacer()
                            .frame(width: 0)
                    }
                    .font(.system(size: 24))
                }
                
                Slider(value: $weightLossSpeed, in: 0...3, step: 0.1)
                    .padding(.horizontal)
                    .tint(.black)
                    .onChange(of: weightLossSpeed) { _, newValue in
                        userData.weightLossSpeed = newValue
                    }
            }
            .opacity(isViewVisible ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: isViewVisible)
            
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
    GoalSpeedView(userData: UserData())
}
