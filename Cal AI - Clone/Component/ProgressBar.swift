//
//  ProgressBar.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 4)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Rectangle()
                    .frame(width: geometry.size.width * progress, height: 4)
                    .foregroundColor(Color.black)
                    .animation(.easeInOut, value: progress)
            }
            .cornerRadius(4)
        }
        .frame(height: 8)
    }
}

#Preview {
    ProgressBar(progress: 0.8)
}
