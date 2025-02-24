//
//  SocialSourceView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct SocialSourceView: View {
    @ObservedObject var userData: UserData
    
    let sources = [
        ("Instagram", "instagram", false),
        ("Facebook", "facebook", false),
        ("TikTok", "music.note", false),
        ("YouTube", "play.rectangle", false),
        ("Google", "magnifyingglass", false),
        ("TV", "tv", false),
        ("Friend or Family", "person.2", true),
        ("Other", "ellipsis", true)
    ] // (Title, image resource, isSystemIcon)
    
    var body: some View {
        VStack {
            Text("Where did you hear about us?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(sources, id: \.0) { source, icon, isFromSystem in
                        Button(action: {
                            userData.socialSource = source
                        }) {
                            HStack {
                                if !isFromSystem {
                                    Image(systemName: icon)
                                        .foregroundColor(.blue)
                                } else {
                                    Image(icon)
                                        .resizable()
                                        .scaledToFit()
                                }
                                
                                Text(source)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Spacer()
                                if userData.socialSource == source {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}



// InfoView.swift
struct InfoView: View {
    var body: some View {
        VStack {
            Text("Cal AI creates long-term results")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Image(systemName: "chart.line.uptrend.xyaxis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            
            Spacer()
        }
    }
}

#Preview {
    SocialSourceView(userData: UserData())
}
