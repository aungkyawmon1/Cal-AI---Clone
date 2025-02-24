//
//  SpecificDietView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct SpecificDietView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let specificDiets = [
        SelectableTextButtonWithIconVO(name: "classic".localized , icon: "figure.highintensity.intervaltraining"),
        SelectableTextButtonWithIconVO(name: "pescatarian".localized, icon: "figure.hiking"),
        SelectableTextButtonWithIconVO(name: "vegetarian".localized, icon: "figure.hockey"),
        SelectableTextButtonWithIconVO(name: "vegan".localized , icon: "figure.field.hockey")
    ] // (Title, image resource)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("do_you_follow_a_specific_diet".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            VStack(spacing: 12) {
                ForEach(Array(specificDiets.enumerated()), id: \.element) { index, specificDiet in
                    
                    SelectableTextButtonWithIcon(
                        icon: specificDiet.icon,
                        text: specificDiet.name,
                        isSelected: userData.specificDiet == specificDiet.name,
                        isSystemImage: true
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            userData.specificDiet = specificDiet.name
                        }
                    }
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
    SpecificDietView(userData: UserData())
}
