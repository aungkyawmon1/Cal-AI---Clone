//
//  WeightLossInfoView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct WeightLossInfoView: View {
    let targetWeight: Double
    
    
    private var attributedText: AttributedString {
            var text = AttributedString("Losing \(Int(targetWeight)) lbs is a realistic target. It's not hard at all!")
            
            // Find the range of the weight value
            if let range = text.range(of: "\(Int(targetWeight)) lbs") {
                // Apply color attribute to the weight value
                text[range].foregroundColor = Color(
                    red: 255/255,
                    green: 165/255,
                    blue: 0/255
                ) // Orange-gold color
            }
            
            // Apply bold font to entire text
            text.font = .title
            
            return text
        }
    
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()
            
            Text(attributedText)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            
            Text("90% of users say that the change is obvious after using Cal AI and it is not easy to rebound.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    WeightLossInfoView(targetWeight: 3.0)
}
