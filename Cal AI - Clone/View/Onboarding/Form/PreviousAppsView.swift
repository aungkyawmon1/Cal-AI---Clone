//
//  PreviousAppsView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct PreviousAppsView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("have_you_tried_other_calorie_tracking_apps".localized)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                SelectableTextButtonWithIcon(
                    icon: "hand.thumbsup.fill",
                    text: "yes".localized,
                    isSelected: userData.hasTriedOtherApps == true,
                    isSystemImage: true
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        userData.hasTriedOtherApps = true
                    }
                }
                .modifier(SlideInFromTopModifier(
                    isPresented: isViewVisible,
                    delay: 0.1
                ))
                
                SelectableTextButtonWithIcon(
                    icon: "hand.thumbsdown.fill",
                    text: "no".localized,
                    isSelected: userData.hasTriedOtherApps == false,
                    isSystemImage: true
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        userData.hasTriedOtherApps = false
                    }
                }
                .modifier(SlideInFromTopModifier(
                    isPresented: isViewVisible,
                    delay: 0.1
                ))
                
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
    PreviousAppsView(userData: UserData())
}
