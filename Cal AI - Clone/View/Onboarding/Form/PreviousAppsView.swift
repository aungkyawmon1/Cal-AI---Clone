//
//  PreviousAppsView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct PreviousAppsView: View {
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack {
            Text("Have you tried other calorie tracking apps?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            VStack(spacing: 20) {
                Button(action: { userData.hasTriedOtherApps = true }) {
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.system(size: 30))
                        Text("Yes")
                            .font(.title2)
                        Spacer()
                        if userData.hasTriedOtherApps == true {
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                
                Button(action: { userData.hasTriedOtherApps = false }) {
                    HStack {
                        Image(systemName: "hand.thumbsdown.fill")
                            .font(.system(size: 30))
                        Text("No")
                            .font(.title2)
                        Spacer()
                        if userData.hasTriedOtherApps == false {
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    PreviousAppsView(userData: UserData())
}
