//
//  MetricInputView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct MetricInputView: View {
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("Height (cm)")
                    .font(.headline)
                
                HStack {
                    Picker("Height", selection: $userData.height.cm) {
                        ForEach(60...243, id: \.self) { cm in
                            Text("\(cm) cm").tag(cm)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .frame(height: 150)
            }
            
            VStack(alignment: .leading) {
                Text("Weight (kg)")
                    .font(.headline)
                
                HStack {
                    Picker("Weight", selection: $userData.weight.kg) {
                        ForEach(20...360, id: \.self) { kg in
                            Text("\(kg) kg").tag(kg)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .frame(height: 150)
            }
        }
        .padding()
    }
}
