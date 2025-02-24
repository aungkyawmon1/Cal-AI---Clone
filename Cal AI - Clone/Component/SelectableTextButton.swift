//
//  SelectableTextButton.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

import SwiftUI

struct SelectableTextButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.headline)
                .foregroundColor(isSelected ? .white : .black)
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
    SelectableTextButton(text: "String", isSelected: false, action: { print("Action") })
}
