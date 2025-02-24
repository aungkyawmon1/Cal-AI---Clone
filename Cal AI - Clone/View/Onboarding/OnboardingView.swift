//
//  RegistrationView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct RegistrationView: View {
    @State private var currentStep = 0
    @State private var showHomeView = false // For home view showing
    @ObservedObject var userData = UserData()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if currentStep > 0 {
                        currentStep -= 1
                    } else {
                        // Go back to onboarding view when on first step
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Image(systemName: "chevron.left") // Back arrow icon
                        .foregroundColor(.black)
                        .imageScale(.large)
                }

                ProgressBar(progress: CGFloat(currentStep + 1) / 7.0)
                    .frame(height: 8)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()

            Spacer()

            // Content views
            switch currentStep {
            case 0:
                GenderSelectionView(userData: userData)
            case 1:
                WorkoutSelectionView(userData: userData)
            case 2:
                SocialSourceView(userData: userData)
            case 3:
                PreviousAppsView(userData: userData)
            case 4:
                InfoView()
            case 5:
                HeightWeightView(userData: userData)
            case 6:
                BirthDateView(userData: userData)
            default:
                EmptyView()
            }

            Spacer()

            // Next/Finish button
            Button(action: {
                if currentStep < 6 {
                    currentStep += 1
                } else {
                    showHomeView = true
                }
            }) {
                Text(currentStep < 6 ? "next".localized : "finish".localized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(shouldEnableNextButton ? Color.black : Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .disabled(!shouldEnableNextButton)
        }
        .fullScreenCover(isPresented: $showHomeView) {
                    HomeView(userData: userData)
                }
    }
    
    private var shouldEnableNextButton: Bool {
            switch currentStep {
            case 0:
                return !userData.gender.isEmpty
            case 1:
                return true
            case 2:
                return !userData.socialSource.isEmpty
            case 3:
                return userData.hasTriedOtherApps != nil
            case 4:
                return true
            case 5:
                return true
            case 6:
                return true
            default:
                return false
            }
        }
}

#Preview {
    RegistrationView()
}
