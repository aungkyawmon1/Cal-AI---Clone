//
//  ReferralCodeView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct ReferralCodeView: View {
    @ObservedObject var userData: UserData
    @FocusState private var isInputFocused: Bool
    @State private var isViewVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("do_you_have_a_referral_code".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("you_can_skip_this_step".localized)
                    .font(.body)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            // Floating Label TextField
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isInputFocused ? Color.black : Color.gray, lineWidth: 1)
                    .frame(height: 60)
                
                VStack(alignment: .leading, spacing: 0) {
                    if isInputFocused || !userData.referralCode.isEmpty {
                        Text("referral_code".localized)
                            .font(.caption)
                            .foregroundColor(isInputFocused ? .black : .gray)
                            .padding(.horizontal, 16)
                            .padding(.top, 12)
                    }
                    
                    TextField((isInputFocused || !userData.referralCode.isEmpty) ? "" : "referral_code".localized,
                              text: $userData.referralCode)
                    .focused($isInputFocused)
                    .padding(.horizontal, 16)
                    .padding(.top, (isInputFocused || !userData.referralCode.isEmpty) ? 0 : -12)
                }
                .frame(maxHeight: .infinity)
                .offset(y: (isInputFocused || !userData.referralCode.isEmpty) ? -10 : 10)
            }
            .opacity(isViewVisible ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: isViewVisible)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onTapGesture {
            isInputFocused = false
        }
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
    ReferralCodeView(userData: UserData())
}
