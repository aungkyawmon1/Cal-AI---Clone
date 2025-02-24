//
//  RegistrationView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var showHomeView = false // For home view showing
    @State private var showLoadingView = false // For complete loading view
    @ObservedObject var userData = UserData()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        if currentStep > 0 {
                            if currentStep == 11 && userData.goal == "maintain".localized {
                                currentStep = 7
                            } else {
                                currentStep -= 1
                            }
                            
                        } else {
                            // Go back to onboarding view when on first step
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        
                        Image(systemName: "arrow.backward") // Back arrow icon
                            .foregroundColor(.black)
                            .imageScale(.large)
                            .frame(width: 40, height: 40) // Fixed size
                            .background(Color.gray.opacity(0.15)) // Custom light gray
                            .clipShape(Circle())
                    }
                    
                    ProgressBar(progress: CGFloat(currentStep + 1) / 18.0)
                        .frame(height: 8)
                        .padding(.horizontal)
                    
                }
                .padding(.horizontal, 20)
                
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
                    
                case 7:
                    GoalSelectionView(userData: userData)
                case 8:
                    DesiredWeightView(userData: userData,
                                      isGaining: userData.goal == "gain_weight".localized)
                case 9:
                    WeightLossInfoView(targetWeight: userData.desiredWeight)
                case 10:
                    ComparisonInfoView(goal: userData.goal)
                case 11:
                    GoalSpeedView(userData: userData)
                case 12:
                    MaintainanceObstaclesView(userData: userData)
                case 13:
                    SpecificDietView(userData: userData)
                case 14:
                    AccomplishView(userData: userData)
                case 15:
                    ReviewView()
                case 16:
                    ReferralCodeView(userData: userData)
                case 17:
                    AllDoneView()
                default:
                    EmptyView()
                }
                    
                
                
                Spacer()
                
                // Next/Finish button
                Button(action: {
                    if currentStep < 17 {
                        if currentStep == 7 && userData.goal == "maintain".localized {
                            currentStep = 11
                        } else {
                            currentStep += 1
                        }
                       
                    } else {
                        showLoadingView = true
                        // Wait 5 seconds before showing HomeView
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            showLoadingView = false
                            showHomeView = true
                        }
                    }
                }) {
                    Text(currentStep < 17 ? "next".localized : "finish".localized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(shouldEnableNextButton ? Color.black : Color.gray)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                .disabled(!shouldEnableNextButton)
                .frame(height: 50)
                
                Spacer()
                    .frame(height: 20)
            }
            .opacity(showLoadingView ? 0 : 1)
            
            // Loading View
            if showLoadingView {
                CompleteLoadingView()
                    .transition(.opacity)
                    .animation(.easeInOut, value: showLoadingView)
            }
        }
        .fullScreenCover(isPresented: $showHomeView) {
            HomeView(userData: userData)
                .onAppear()
        }
    }
    
    private var shouldEnableNextButton: Bool {
        switch currentStep {
        case 0:
            return !userData.gender.isEmpty
        case 1:
            return !userData.workoutsPerWeek.isEmpty
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
        case 7:
            return !userData.goal.isEmpty
        case 8:
            return userData.desiredWeight != 0.0
        case 9, 10:
            return true
        case 11:
            return userData.weightLossSpeed != 0.0
        case 12:
            return !userData.maintainanceObstacle.isEmpty
        case 13:
            return !userData.specificDiet.isEmpty
        case 14:
            return !userData.accomplishment.isEmpty
        case 15, 16, 17:
            return true
        default:
            return false
        }
    }
}

#Preview {
    OnboardingView()
}
