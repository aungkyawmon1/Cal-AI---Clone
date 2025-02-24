//
//  InfoView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct InfoView: View {
    @State private var isViewVisible = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("cal_ai_creates_long_term_results".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image("charticon")
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
    InfoView()
}
