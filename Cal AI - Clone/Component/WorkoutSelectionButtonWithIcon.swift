//
//  WorkoutSelectionButtonWithIcon.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct WorkoutSelectionButtonWithIcon: View {
    let icon: String
    let text: String
    let caption: String
    let isSelected: Bool
    let isSystemImage: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Icon with white circle background
                ZStack {
                    Circle()
                        .fill(.white)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                        .frame(width: 44, height: 44)
                    
                    if isSystemImage {
                        Image(systemName: icon)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    } else {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(text)
                        .font(.headline)
                        .foregroundColor(isSelected ? .white : .black)
                    
                    Text(caption)
                        .font(.caption)
                        .foregroundColor(isSelected ? .white : .black)
                }
                
                
                Spacer()
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.black : Color.gray.opacity(0.2))
            )
        }
    }
}

#Preview {
    WorkoutSelectionButtonWithIcon(icon: "facebook", text: "Yes", caption: "Delight", isSelected: true, isSystemImage: false, action: { print("Yes") })
}
