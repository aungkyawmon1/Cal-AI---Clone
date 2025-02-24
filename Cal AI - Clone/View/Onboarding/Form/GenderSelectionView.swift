//
//  GenderSelectionView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct GenderSelectionView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            Text("choose_gender".localized)
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text("description".localized)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            ForEach(["male".localized, "female".localized, "other".localized], id: \.self) { gender in
                Button(action: {
                    userData.gender = gender
                }) {
                    HStack {
                        Text(gender)
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        if userData.gender == gender {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            }

            Spacer()
        }
    }
}

#Preview {
    GenderSelectionView(userData: UserData())
}
