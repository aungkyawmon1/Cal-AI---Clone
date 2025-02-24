//
//  ImperialInputView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct ImperialInputView: View {
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("Height (ft & in)")
                    .font(.headline)
                
                HStack {
                    Picker("Feet", selection: $userData.height.feet) {
                        ForEach(1...8, id: \.self) { ft in
                            Text("\(ft) ft").tag(ft)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    Picker("Inches", selection: $userData.height.inches) {
                        ForEach(0...11, id: \.self) { inch in
                            Text("\(inch) in").tag(inch)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .frame(height: 150)
            }
            
            VStack(alignment: .leading) {
                Text("Weight (lb)")
                    .font(.headline)
                
                HStack {
                    Picker("Weight", selection: $userData.weight.lb) {
                        ForEach(50...700, id: \.self) { lb in
                            Text("\(lb) lb").tag(lb)
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
