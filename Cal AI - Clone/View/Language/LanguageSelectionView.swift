//
//  LanguageSelectionView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var localizationManager: LocalizationManager
    @Binding var selectedLanguage: LocalizationLanguage
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ForEach([LocalizationLanguage.english, .japanese, .turkish], id: \.self) { language in
                    Button(action: {
                        withAnimation {
                            selectedLanguage = language
                            localizationManager.changeLanguage(to: language)
                            dismiss()  // Dismiss the sheet after language change
                        }
                    }) {
                        HStack {
                            Text(language.displayName)
                                .font(.headline)
                            Spacer()
                            if selectedLanguage == language {
                                Image(systemName: "checkmark")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            selectedLanguage == language ?
                            Color.black : Color.white
                        )
                        .foregroundColor(
                            selectedLanguage == language ?
                            Color.white : Color.black
                        )
                        .cornerRadius(10)
                        .shadow(
                            color: selectedLanguage == language ?
                            Color.clear : Color.gray.opacity(0.2),
                            radius: 5
                        )
                    }
                }
            }
            .padding()
            .navigationTitle("Select Language".localized)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
