//
//  ReviewView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct ReviewView: View {
    @State private var rating: Int = 0
    
    let reviews = [
        ("John", "profile1", "Cal AI has completely transformed my approach to healthy eating. The personalized recommendations are spot-on!"),
        ("Merry", "profile2", "Cal AI has completely transformed my approach to healthy eating. The personalized recommendations are spot-on!"),
    ] // (name, profile, review)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Give us a rating")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Star Rating
                HStack(spacing: 8) {
                    Spacer()
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 30))
                    }
                    Spacer()
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                
                Spacer()
                
                
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("Cal AI was made for people like you")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Profile Images
                    HStack(spacing: -10) {
                        ForEach(0..<3) { index in
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image("profile\(index + 1)")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(20)
                                )
                        }
                    }
                    
                    Text("+2M Cal AI Users")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    // Review Cells
                    VStack(spacing: 15) {
                        ForEach(reviews, id: \.0) { name, profile, review in
                            ReviewCell(name: name, profile: profile, review: review)
                        }
                    }
                } // VStack
                
            }
            .padding(.horizontal, 20)
        } // ScrollView
    }
}

#Preview {
    ReviewView()
}
