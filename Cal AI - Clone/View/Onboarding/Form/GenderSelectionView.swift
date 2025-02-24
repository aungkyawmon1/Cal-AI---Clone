//
//  GenderSelectionView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct GenderSelectionView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let genderOptions = ["male".localized, "female".localized, "other".localized]
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("choose_gender".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("description".localized)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5).delay(0.2), value: isViewVisible)
            }
            
            Spacer()
            
            VStack(spacing: 12) {
                ForEach(Array(genderOptions.enumerated()), id: \.element) { index, gender in
                    SelectableTextButton(
                        text: gender,
                        isSelected: userData.gender == gender,
                        action: {
                            userData.gender = gender
                        }
                    )
                    .modifier(SlideInFromTopModifier(
                        isPresented: isViewVisible,
                        delay: 0.3 + Double(index) * 0.1
                    ))
                }
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
    GenderSelectionView(userData: UserData())
}
