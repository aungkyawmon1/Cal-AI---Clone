//
//  AccomplishView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct AccomplishView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let accomplishLists = [
        SelectableTextButtonWithIconVO(name: "eat_and_live_healthier".localized , icon: "bolt.heart.fill"),
        SelectableTextButtonWithIconVO(name: "boost_my_energy_and_mood".localized, icon: "heart.circle"),
        SelectableTextButtonWithIconVO(name: "stay_motivated_and_consistent".localized, icon: "heart.fill"),
        SelectableTextButtonWithIconVO(name: "feel_better_about_my_body".localized, icon: "heart.circle")
    ] // (Title, image resource)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("what_would_you_like_to_accomplish".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                ForEach(Array(accomplishLists.enumerated()), id: \.element) { index, accomplishment in
                   
                    SelectableTextButtonWithIcon(
                        icon: accomplishment.icon,
                        text: accomplishment.name,
                        isSelected: userData.accomplishment == accomplishment.name,
                        isSystemImage: true
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            userData.accomplishment = accomplishment.name
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
    AccomplishView(userData: UserData())
}
