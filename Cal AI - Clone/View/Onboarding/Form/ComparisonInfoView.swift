//
//  ComparisonInfoView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct ComparisonInfoView: View {
    let goal: String
    @State private var isViewVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Lose twice as much \(goal == "gain_weight".localized ? "weight_gain".localized : "weight_loss".localized) with Cal AI vs on your own")
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                
                Image("comparison_chart") // Add your comparison chart image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(8)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Spacer()
                
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
    ComparisonInfoView(goal: "Goal")
}
