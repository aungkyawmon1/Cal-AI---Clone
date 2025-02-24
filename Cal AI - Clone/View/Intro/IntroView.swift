//
//  OnboardingView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct IntroView: View {
    @StateObject private var localizationManager = LocalizationManager()
    @State private var navigateToRegistration = false
    @State private var showLanguageSelection = false
    @State private var viewRefresh = false  // For language change

    var body: some View {
        NavigationStack { // Replace NavigationView with NavigationStack
            VStack {
                Spacer()
                Text("welcome_title".localized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("welcome_description".localized)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                Button(action: {
                    navigateToRegistration = true
                }) {
                    Text("get_started".localized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                .frame(height: 50)
                
                Spacer()
                    .frame(height: 20)
                
            }
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showLanguageSelection = true
                    }) {
                        Image(systemName: "globe")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showLanguageSelection) {
                LanguageSelectionView(selectedLanguage: $localizationManager.currentLanguage)
                    .environmentObject(localizationManager)
            }
            .navigationDestination(isPresented: $navigateToRegistration) {
                OnboardingView()
                    .navigationBarBackButtonHidden(true)
            }
            .id(viewRefresh)
        }
        .environmentObject(localizationManager)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("LanguageChanged"))) { _ in
            viewRefresh.toggle()
        }
    }
}

#Preview {
    IntroView()
}
