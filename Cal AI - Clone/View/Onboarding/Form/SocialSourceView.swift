//
//  SocialSourceView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct SocialSourceView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
    let sources = [
        SelectableTextButtonWithIconVO(name: "Instagram", icon: "instagram"),
        SelectableTextButtonWithIconVO(name: "Facebook", icon: "facebook"),
        SelectableTextButtonWithIconVO(name: "TikTok", icon: "tiktok"),
        SelectableTextButtonWithIconVO(name: "YouTube", icon: "youtube"),
        SelectableTextButtonWithIconVO(name: "Google", icon: "google"),
        SelectableTextButtonWithIconVO(name: "TV", icon: "tv"),
        SelectableTextButtonWithIconVO(name: "Friend or Family", icon: "audience"),
        SelectableTextButtonWithIconVO(name: "Other", icon: "more")
    ] // (Title, image resource)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("where_did_you_hear_about_us".localized)
                .font(.title)
                .fontWeight(.bold)
                .opacity(isViewVisible ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: isViewVisible)
            
              
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(sources) { socialVO in
                        SelectableTextButtonWithIcon(
                            icon: socialVO.icon,
                            text: socialVO.name,
                            isSelected: userData.socialSource == socialVO.name,
                            isSystemImage: false
                        ) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                userData.socialSource = socialVO.name
                            }
                        }
                        .modifier(SlideInFromTopModifier(
                            isPresented: isViewVisible,
                            delay: 0.3 + Double(sources.firstIndex(of: socialVO) ?? 0) * 0.1
                        ))
                    }
                }
            }
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
    SocialSourceView(userData: UserData())
}
