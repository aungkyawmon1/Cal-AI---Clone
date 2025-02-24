//
//  ReviewCell.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct ReviewCell: View {
    let name: String
    let profile: String
    let review: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(profile)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 38, height: 38)
                            .cornerRadius(19)
                    )
                
                Text(name)
                    .font(.headline)
                
                HStack {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                    }
                }
                
            }
            
            Text(review)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
