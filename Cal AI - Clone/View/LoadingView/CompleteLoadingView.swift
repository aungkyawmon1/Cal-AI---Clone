//
//  CompleteLoadingView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct CompleteLoadingView: View {
    @State private var isLoading = true
    @State private var progress: Double = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("We're setting \n everything up for you")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            ProgressView()
                .scaleEffect(1.5)
        }
        .onAppear {
            // Simulate 5-second loading
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                progress += 0.02
                if progress >= 1.0 {
                    timer.invalidate()
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    CompleteLoadingView()
}
