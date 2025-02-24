//
//  DesiredWeightView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct DesiredWeightView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let isGaining: Bool
    
    var weightRange: ClosedRange<Double> {
        isGaining ? -10...500 : 300...900
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("what_is_your_desired_weight".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                Text(isGaining ? "gain_weight".localized : "lose_weight".localized)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                Spacer()
            }
            .padding()
            
            RulerView(selectedValue: $userData.desiredWeight, range: weightRange)
                .modifier(SlideInFromTopModifier(
                    isPresented: isViewVisible,
                    delay: 0.3
                ))
            
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
    DesiredWeightView(userData: UserData(), isGaining: false)
}
