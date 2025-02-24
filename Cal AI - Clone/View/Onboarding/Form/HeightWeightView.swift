//
//  HeightWeightView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct HeightWeightView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("height_and_weight".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("description".localized)
                    .font(.body)
                    .foregroundColor(.gray)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            VStack {
                
                Picker("System", selection: $userData.useMetricSystem) {
                    Text("imperial".localized).tag(false)
                    Text("metric".localized).tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if userData.useMetricSystem {
                    MetricInputView(userData: userData)
                } else {
                    ImperialInputView(userData: userData)
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
    HeightWeightView(userData: UserData())
}
