//
//  SelectableTextButtonLeading.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct SelectableTextButtonLeading: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .black)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.black : Color.gray.opacity(0.2))
            )
        }
    }
}

#Preview {
    SelectableTextButtonLeading(text: "Test", isSelected: true, action: { print("hello")})
}
