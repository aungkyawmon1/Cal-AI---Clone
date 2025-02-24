//
//  SlideInFromTopModifier.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct SlideInFromTopModifier: ViewModifier {
    let isPresented: Bool
    var delay: Double = 0
   
    func body(content: Content) -> some View {
        content
            .offset(y: isPresented ? 0 : -20)
            .opacity(isPresented ? 1 : 0)
            .animation(
                .easeOut(duration: 0.3)
                .delay(delay),
                value: isPresented
            )
    }
}
