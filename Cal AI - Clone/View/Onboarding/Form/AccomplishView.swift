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
    
    let accomplishLists: [String] = [
        "eat_and_live_healthier".localized,
        "boost_my_energy_and_mood".localized,
        "stay_motivated_and_consistent".localized,
        "feel_better_about_my_body".localized
    ]
    
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
                    SelectableTextButton(
                        text: accomplishment,
                        isSelected: userData.accomplishment == accomplishment,
                        action: {
                            userData.accomplishment = accomplishment
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
    AccomplishView(userData: UserData())
}
