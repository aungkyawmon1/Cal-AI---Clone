//
//  HeightWeightView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct HeightWeightView: View {
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack {
            Text("Height & Weight")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("This will be used to calibrate your custom plan.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Picker("System", selection: $userData.useMetricSystem) {
                Text("Imperial").tag(false)
                Text("Metric").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if userData.useMetricSystem {
                MetricInputView(userData: userData)
            } else {
                ImperialInputView(userData: userData)
            }
        }
    }
}

#Preview {
    HeightWeightView(userData: UserData())
}
